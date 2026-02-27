import '../../domain/domain.dart';
import '../../infrastructure/infrastructure.dart';

final class FastlaneExecutor {
  FastlaneExecutor(this._processService);
  final ProcessService _processService;

  /// Runs a Fastlane lane. [projectPath] is the Flutter project root.
  /// [platformDir] is the platform folder (android or ios) where fastlane/ lives.
  /// Executes: cd platformDir && fastlane laneName
  /// [env] is merged into the process environment (e.g. LAST_BUILD_PATH).
  /// Returns exit code; 0 = success.
  Future<int> runLane(
    String projectPath,
    String platformDir,
    String laneName, {
    required void Function(String line, bool isError) onOutput,
    Map<String, String>? env,
    List<String>? extraArgs,
  }) async {
    final extra = extraArgs != null && extraArgs.isNotEmpty ? ' ${extraArgs.join(' ')}' : '';
    final cmd = 'cd "$platformDir" && bundle exec fastlane $laneName$extra && cd ..';
    final result = await _processService.run(
      executable: 'sh',
      arguments: ['-c', cmd],
      workingDirectory: projectPath,
      onOutput: onOutput,
      environment: env,
    );
    return result.exitCode;
  }

  /// Cancels the currently running Fastlane process.
  void cancel() {
    _processService.cancel();
  }

  /// Resolves lane name from target and options.
  /// User's Fastfile must define these lanes; BuildPaw only invokes them.
  static String laneNameForTarget(
    PublishTarget target, {
    String? playTrack,
  }) {
    return switch (target) {
      PublishTarget.firebase => 'firebase',
      PublishTarget.googlePlay => playTrack != null ? 'play_$playTrack' : 'play_internal',
      PublishTarget.appStoreConnect => 'testflight',
    };
  }
}
