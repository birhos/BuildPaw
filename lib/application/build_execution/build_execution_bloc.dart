import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';
import '../../infrastructure/infrastructure.dart';

final class BuildExecutionBloc extends Bloc<BuildExecutionEvent, BuildExecutionState> {
  BuildExecutionBloc({
    required ProcessService processService,
    required BuildCommandGenerator commandGenerator,
    required ArtifactManager artifactManager,
  }) : _processService = processService,
       _commandGenerator = commandGenerator,
       _artifactManager = artifactManager,
       super(const BuildIdle()) {
    on<BuildStarted>(_onBuildStarted);
    on<BuildLogReceived>(_onBuildLogReceived);
    on<BuildCancelled>(_onBuildCancelled);
  }
  final ProcessService _processService;
  final BuildCommandGenerator _commandGenerator;
  final ArtifactManager _artifactManager;

  bool _isCancelled = false;

  Future<void> _onBuildStarted(
    BuildStarted event,
    Emitter<BuildExecutionState> emit,
  ) async {
    _isCancelled = false;

    final allCommands = <MapEntry<BuildPlatform, BuildCommand>>[];

    for (final platform in event.platforms) {
      final commands = switch (platform) {
        BuildPlatform.android =>
          event.androidConfig != null
              ? _commandGenerator
                    .generateAndroid(
                      config: event.androidConfig!,
                      useFvm: event.useFvm,
                    )
                    .map((c) => MapEntry(platform, c))
              : <MapEntry<BuildPlatform, BuildCommand>>[],
        BuildPlatform.ios =>
          event.iosConfig != null
              ? _commandGenerator
                    .generateIos(
                      config: event.iosConfig!,
                      useFvm: event.useFvm,
                    )
                    .map((c) => MapEntry(platform, c))
              : <MapEntry<BuildPlatform, BuildCommand>>[],
        BuildPlatform.web =>
          event.webConfig != null
              ? _commandGenerator
                    .generateWeb(
                      config: event.webConfig!,
                      useFvm: event.useFvm,
                    )
                    .map((c) => MapEntry(platform, c))
              : <MapEntry<BuildPlatform, BuildCommand>>[],
      };
      allCommands.addAll(commands);
    }

    if (allCommands.isEmpty) {
      emit(const BuildError(error: 'No build commands generated.'));
      return;
    }

    var logs = <LogEntry>[];
    final results = <BuildResult>[];
    var completedCount = 0;
    final totalCount = allCommands.length;

    emit(
      BuildRunning(
        logs: logs,
        totalCount: totalCount,
      ),
    );

    for (final entry in allCommands) {
      if (_isCancelled) {
        logs = [
          ...logs,
          const LogEntry(text: '\n⚠ Build cancelled by user.', isError: true),
        ];
        emit(BuildError(error: 'Build cancelled.', logs: logs));
        return;
      }

      final platform = entry.key;
      final command = entry.value;

      logs = [
        ...logs,
        LogEntry(
          text: '\n━━━ Building ${command.displayName} ━━━',
          isHeader: true,
        ),
        LogEntry(text: '> ${command.fullCommand}'),
      ];

      emit(
        BuildRunning(
          logs: logs,
          currentPlatform: platform,
          completedCount: completedCount,
          totalCount: totalCount,
        ),
      );

      final stopwatch = Stopwatch()..start();

      final result = await _processService.run(
        executable: command.executable,
        arguments: command.arguments,
        workingDirectory: event.projectPath,
        onOutput: (line, isError) {
          add(BuildLogReceived(line: line, isError: isError));
        },
      );

      stopwatch.stop();

      if (state is BuildRunning) {
        logs = List.from((state as BuildRunning).logs);
      }

      results.add(
        BuildResult(
          platform: platform,
          success: result.success,
          duration: stopwatch.elapsed,
          logs: result.logs,
        ),
      );

      completedCount++;

      if (!result.success) {
        logs = [
          ...logs,
          LogEntry(
            text: '\n✗ ${command.displayName} failed (exit code: ${result.exitCode})',
            isError: true,
          ),
        ];
        emit(
          BuildError(
            error: '${command.displayName} build failed.',
            logs: logs,
          ),
        );
        return;
      }

      logs = [
        ...logs,
        LogEntry(
          text: '\n✓ ${command.displayName} completed in ${_formatDuration(stopwatch.elapsed)}',
        ),
      ];

      emit(
        BuildRunning(
          logs: logs,
          currentPlatform: platform,
          completedCount: completedCount,
          totalCount: totalCount,
        ),
      );
    }

    // Collect artifacts
    logs = [
      ...logs,
      const LogEntry(text: '\n━━━ Collecting Artifacts ━━━', isHeader: true),
    ];
    emit(BuildRunning(logs: logs, completedCount: totalCount, totalCount: totalCount));

    try {
      final outputPath = await _artifactManager.collectArtifacts(
        projectPath: event.projectPath,
        projectName: event.projectName,
        platforms: event.platforms,
        androidConfig: event.androidConfig,
      );

      await _artifactManager.openOutputInFinder(outputPath);

      logs = [
        ...logs,
        LogEntry(text: '✓ Artifacts copied to: $outputPath'),
        const LogEntry(text: '✓ Finder opened.'),
        const LogEntry(text: '\n🐾 All builds completed successfully!'),
      ];

      emit(
        BuildSuccess(
          results: results,
          outputPath: outputPath,
          logs: logs,
          projectPath: event.projectPath,
          projectName: event.projectName,
        ),
      );
    } catch (e) {
      logs = [
        ...logs,
        LogEntry(text: 'Warning: Failed to collect artifacts: $e', isError: true),
      ];
      emit(
        BuildSuccess(
          results: results,
          outputPath: '',
          logs: logs,
          projectPath: event.projectPath,
          projectName: event.projectName,
        ),
      );
    }
  }

  void _onBuildLogReceived(
    BuildLogReceived event,
    Emitter<BuildExecutionState> emit,
  ) {
    if (state is BuildRunning) {
      final current = state as BuildRunning;
      final updatedLogs = [
        ...current.logs,
        LogEntry(text: event.line, isError: event.isError),
      ];
      emit(current.copyWith(logs: updatedLogs));
    }
  }

  void _onBuildCancelled(
    BuildCancelled event,
    Emitter<BuildExecutionState> emit,
  ) {
    _isCancelled = true;
    _processService.cancel();
  }

  String _formatDuration(Duration d) {
    if (d.inMinutes > 0) {
      return '${d.inMinutes}m ${d.inSeconds.remainder(60)}s';
    }
    return '${d.inSeconds}s';
  }
}
