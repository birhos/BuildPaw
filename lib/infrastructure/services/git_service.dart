import 'process_service.dart';

class GitService {
  final ProcessService _processService;

  GitService(this._processService);

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
}
