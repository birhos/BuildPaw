import '../../infrastructure/infrastructure.dart';

final class FastlaneDetector {
  FastlaneDetector(this._processService);
  final ProcessService _processService;

  Future<bool> isInstalled() async {
    final result = await _processService.runWithExitCode(
      executable: 'which',
      arguments: ['fastlane'],
    );
    if (result.exitCode != 0) return false;
    if (result.stdout.isEmpty) return false;
    return true;
  }
}
