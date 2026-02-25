import 'process_service.dart';

final class GitService {
  GitService(this._processService);
  final ProcessService _processService;

  Future<String> getCurrentBranch(String projectPath) async {
    try {
      final result = await _processService.runAndCapture(
        executable: 'git',
        arguments: ['branch', '--show-current'],
        workingDirectory: projectPath,
      );
      return result.isNotEmpty ? result : 'unknown';
    } catch (_) {
      return 'unknown';
    }
  }

  /// Returns the latest git tag, or null if no tags exist.
  Future<String?> getLatestTag(String projectPath) async {
    try {
      final result = await _processService.runAndCapture(
        executable: 'git',
        arguments: ['describe', '--tags', '--abbrev=0'],
        workingDirectory: projectPath,
      );
      return result.isNotEmpty ? result : null;
    } catch (_) {
      return null;
    }
  }
}
