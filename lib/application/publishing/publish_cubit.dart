import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import '../../infrastructure/infrastructure.dart';
import '../last_build_output/last_build_output_cubit.dart';
import 'fastlane_config_generator.dart';
import 'fastlane_detector.dart';
import 'fastlane_executor.dart';
import 'fastlane_installer.dart';
import 'publish_state.dart';

final class PublishCubit extends Cubit<PublishState> {
  PublishCubit({
    required FastlaneDetector fastlaneDetector,
    required FastlaneInstaller fastlaneInstaller,
    required FastlaneExecutor fastlaneExecutor,
    required NotificationService notificationService,
    required LastBuildOutputCubit lastBuildOutput,
    required PublishProfileRepository profileRepository,
    required ProcessService processService,
    required FlutterService flutterService,
  }) : _detector = fastlaneDetector,
       _installer = fastlaneInstaller,
       _executor = fastlaneExecutor,
       _notification = notificationService,
       _lastBuildOutput = lastBuildOutput,
       _profileRepo = profileRepository,
       _processService = processService,
       _flutterService = flutterService,
       super(const PublishIdle());

  final FastlaneDetector _detector;
  final FastlaneInstaller _installer;
  final FastlaneExecutor _executor;
  final ProcessService _processService;
  final FlutterService _flutterService;
  final NotificationService _notification;
  final LastBuildOutputCubit _lastBuildOutput;
  final PublishProfileRepository _profileRepo;

  bool _cancelled = false;

  Future<void> checkAndPublish({
    required String projectPath,
    required PublishTarget target,
    required PublishProfile profile,
    String? releaseNotes,
    String? testerGroup,
    PlayTrack? playTrack,
  }) async {
    _cancelled = false;

    if (!Platform.isMacOS) {
      emit(
        const PublishError(
          message: 'Publish is only supported on macOS.',
          retryable: false,
        ),
      );
      return;
    }

    if (!profile.hasConfigFor(target)) {
      emit(
        PublishError(
          message:
              'Selected profile does not have config for ${target.label}. '
              'Configure the profile first.',
          retryable: false,
        ),
      );
      return;
    }

    emit(const PublishCheckingFastlane());
    final installed = await _detector.isInstalled();
    if (!installed) {
      emit(const PublishFastlaneMissing());
      return;
    }

    final platformDir = FastlaneConfigGenerator.platformDirForTarget(target);
    final fastlaneDir = Directory('$projectPath/$platformDir/fastlane');
    final fastfile = File('$projectPath/$platformDir/fastlane/Fastfile');
    final appfile = File('$projectPath/$platformDir/fastlane/Appfile');
    final envDefault = File('$projectPath/$platformDir/fastlane/.env.default');

    if (!fastfile.existsSync() || !appfile.existsSync()) {
      try {
        if (!fastlaneDir.existsSync()) {
          fastlaneDir.createSync(recursive: true);
        }
        if (!fastfile.existsSync()) {
          final content = target == PublishTarget.appStoreConnect
              ? FastlaneConfigGenerator.generateIosFastfile(profile)
              : FastlaneConfigGenerator.generateAndroidFastfile(profile);
          fastfile.writeAsStringSync(content);
        }
        if (!appfile.existsSync()) {
          final content = target == PublishTarget.appStoreConnect
              ? FastlaneConfigGenerator.generateIosAppfile(profile)
              : FastlaneConfigGenerator.generateAndroidAppfile(profile);
          appfile.writeAsStringSync(content);
        }
        if (!envDefault.existsSync()) {
          final content = target == PublishTarget.appStoreConnect
              ? FastlaneConfigGenerator.generateIosEnvDefault(profile)
              : FastlaneConfigGenerator.generateAndroidEnvDefault(profile);
          envDefault.writeAsStringSync(content);
        }
      } catch (e) {
        emit(
          PublishError(
            message: 'Failed to create Fastlane config: $e',
            retryable: false,
          ),
        );
        return;
      }
    }

    final lastOutput = _lastBuildOutput.state.outputPath;
    final lastProjectPath = _lastBuildOutput.state.projectPath;
    if (lastOutput == null || lastOutput.isEmpty || lastProjectPath != projectPath) {
      emit(
        const PublishError(
          message: 'No recent build output for this project. Run a build first.',
          retryable: false,
        ),
      );
      return;
    }

    final lane = _laneName(target, playTrack);
    final logs = <PublishLogEntry>[
      PublishLogEntry(
        text: '\n━━━ Publishing to ${target.label} ━━━',
        isHeader: true,
      ),
      PublishLogEntry(text: '> cd $platformDir && bundle exec fastlane $lane'),
    ];
    emit(PublishRunning(logs: logs, target: target));

    final env = await _buildEnv(
      profile: profile,
      target: target,
      lastOutput: lastOutput,
      projectPath: projectPath,
      releaseNotes: releaseNotes,
      testerGroup: testerGroup,
    );

    final exitCode = await _runLaneWithGemfileFallback(
      projectPath: projectPath,
      platformDir: platformDir,
      lane: lane,
      env: env,
    );

    if (state is! PublishRunning) return;
    final finalLogs = (state as PublishRunning).logs;

    if (_cancelled) {
      emit(
        PublishError(
          message: 'Publish cancelled by user.',
          logs: [
            ...finalLogs,
            const PublishLogEntry(
              text: '\n⚠ Publish cancelled by user.',
              isError: true,
            ),
          ],
        ),
      );
      return;
    }

    if (exitCode == 0) {
      emit(PublishSuccess(logs: finalLogs));
      await _notification.showPublishSuccess(
        platform: target.label,
        track: playTrack?.value,
      );
    } else {
      emit(
        PublishError(
          message: 'Publish failed (exit code: $exitCode)',
          logs: finalLogs,
        ),
      );
      await _notification.showPublishError();
    }
  }

  /// Stops the current publish or Fastlane installation.
  void stopPublish() {
    _cancelled = true;
    _processService.cancel();
  }

  Future<void> installFastlane({
    void Function(String line, bool isError)? onOutput,
  }) async {
    final logs = <PublishLogEntry>[];
    void capture(String line, bool isError) {
      logs.add(PublishLogEntry(text: line, isError: isError));
      emit(PublishRunning(logs: List.from(logs)));
      onOutput?.call(line, isError);
    }

    emit(PublishRunning(logs: logs));
    final success = await _installer.installViaBrew(onOutput: capture);

    if (success) {
      emit(const PublishIdle());
    } else {
      emit(
        PublishError(
          message: 'Fastlane installation failed. Try running in terminal: brew install fastlane',
          logs: logs,
        ),
      );
    }
  }

  void reset() {
    _cancelled = false;
    emit(const PublishIdle());
  }

  static const _gemfileErrorPattern = 'Could not locate Gemfile or .bundle/ directory';

  Future<int> _runLaneWithGemfileFallback({
    required String projectPath,
    required String platformDir,
    required String lane,
    required Map<String, String> env,
  }) async {
    var exitCode = await _executor.runLane(
      projectPath,
      platformDir,
      lane,
      onOutput: (line, isError) {
        if (state is PublishRunning) {
          final current = state as PublishRunning;
          final updated = [
            ...current.logs,
            PublishLogEntry(text: line, isError: isError),
          ];
          emit(current.copyWith(logs: updated));
        }
      },
      env: env,
    );

    if (exitCode != 0 && state is PublishRunning) {
      final logs = (state as PublishRunning).logs;
      final hasGemfileError = logs.any(
        (e) => e.text.contains(_gemfileErrorPattern),
      );
      if (hasGemfileError) {
        final gemfile = File('$projectPath/$platformDir/Gemfile');
        if (!gemfile.existsSync()) {
          try {
            gemfile.writeAsStringSync(FastlaneConfigGenerator.gemfileContent);
            final pluginfile = File('$projectPath/$platformDir/fastlane/Pluginfile');
            if (!pluginfile.existsSync()) {
              pluginfile.writeAsStringSync(FastlaneConfigGenerator.pluginfileContent);
            }
            if (state is PublishRunning) {
              final current = state as PublishRunning;
              final updated = [
                ...current.logs,
                PublishLogEntry(text: '\n> cd $platformDir && bundle install', isHeader: true),
              ];
              emit(current.copyWith(logs: updated));
            }
            final bundleResult = await _processService.run(
              executable: 'sh',
              arguments: ['-c', 'cd "$platformDir" && bundle install'],
              workingDirectory: projectPath,
              onOutput: (line, isError) {
                if (state is PublishRunning) {
                  final current = state as PublishRunning;
                  final updated = [
                    ...current.logs,
                    PublishLogEntry(text: line, isError: isError),
                  ];
                  emit(current.copyWith(logs: updated));
                }
              },
            );
            if (bundleResult.success) {
              exitCode = await _executor.runLane(
                projectPath,
                platformDir,
                lane,
                onOutput: (line, isError) {
                  if (state is PublishRunning) {
                    final current = state as PublishRunning;
                    final updated = [
                      ...current.logs,
                      PublishLogEntry(text: line, isError: isError),
                    ];
                    emit(current.copyWith(logs: updated));
                  }
                },
                env: env,
              );
            }
          } catch (_) {}
        }
      }
    }

    return exitCode;
  }

  String _laneName(PublishTarget target, PlayTrack? playTrack) {
    return switch (target) {
      PublishTarget.firebase => 'firebase',
      PublishTarget.googlePlay => 'play_${playTrack?.value ?? PlayTrack.internal.value}',
      PublishTarget.appStoreConnect => 'testflight',
    };
  }

  Future<Map<String, String>> _buildEnv({
    required PublishProfile profile,
    required PublishTarget target,
    required String lastOutput,
    required String projectPath,
    String? releaseNotes,
    String? testerGroup,
  }) async {
    final env = <String, String>{
      'LAST_BUILD_PATH': lastOutput,
      if (releaseNotes != null && releaseNotes.isNotEmpty) 'RELEASE_NOTES': releaseNotes,
    };

    switch (target) {
      case PublishTarget.firebase:
        env['FIREBASE_APP_ID'] = profile.firebaseAppId ?? '';
        final token = await _profileRepo.loadSecureValue(
          profile.id,
          'firebase_token',
        );
        env['FIREBASE_TOKEN'] = token ?? '';
        if (testerGroup != null && testerGroup.isNotEmpty) {
          env['FIREBASE_GROUPS'] = testerGroup;
        } else if (profile.firebaseTesterGroups.isNotEmpty) {
          env['FIREBASE_GROUPS'] = profile.firebaseTesterGroups.join(', ');
        }
      case PublishTarget.googlePlay:
        env['PACKAGE_NAME'] = profile.playPackageName ?? '';
        final jsonKey = profile.playServiceAccountJsonPath ?? '';
        env['GOOGLE_PLAY_JSON_KEY'] = jsonKey;
        env['JSON_KEY_FILE'] = jsonKey;
        final version = await _flutterService.getProjectVersion(projectPath);
        if (version != 'unknown') env['VERSION_NAME'] = version;
      case PublishTarget.appStoreConnect:
        env['APP_IDENTIFIER'] = profile.ascBundleId ?? '';
        env['FASTLANE_USER'] = profile.ascAppleId ?? '';
        env['TEAM_ID'] = profile.ascTeamId ?? '';
        env['ITC_TEAM_ID'] = profile.ascItcTeamId ?? profile.ascTeamId ?? '';
        final applePassword = await _profileRepo.loadSecureValue(
          profile.id,
          'fastlane_apple_application_specific_password',
        );
        if (applePassword != null && applePassword.isNotEmpty) {
          env['FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD'] = applePassword;
        }
        env['ASC_KEY_ID'] = profile.ascApiKeyId ?? '';
        env['ASC_ISSUER_ID'] = profile.ascIssuerId ?? '';
        env['ASC_KEY_PATH'] = profile.ascApiKeyPath ?? '';
    }

    return env;
  }
}
