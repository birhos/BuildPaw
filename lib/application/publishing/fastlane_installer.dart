import 'dart:io';

import '../../infrastructure/infrastructure.dart';

final class FastlaneInstaller {
  FastlaneInstaller(this._processService);
  final ProcessService _processService;

  /// Installs Fastlane via Homebrew. Streams output to [onOutput].
  /// Returns true if installation succeeded.
  Future<bool> installViaBrew({
    required void Function(String line, bool isError) onOutput,
  }) async {
    onOutput('\n━━━ Installing Fastlane via Homebrew ━━━', true);
    onOutput('> brew install fastlane', false);

    final workDir = Platform.environment['HOME'] ?? '/';
    final result = await _processService.run(
      executable: 'brew',
      arguments: ['install', 'fastlane'],
      workingDirectory: workDir,
      onOutput: onOutput,
    );

    if (result.success) {
      onOutput('\n✓ Fastlane installed successfully.', false);
    } else {
      onOutput('\n✗ Installation failed (exit code: ${result.exitCode})', true);
    }
    return result.success;
  }
}
