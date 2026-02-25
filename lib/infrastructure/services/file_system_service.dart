import 'dart:io';

import 'package:buildpaw/core/constants/app_constants.dart';

class FileSystemService {
  /// Creates the timestamped output directory structure on the Desktop.
  /// Returns the root output path for this build session.
  Future<String> createOutputDirectory({
    required String projectName,
    required DateTime timestamp,
  }) async {
    final home = Platform.environment['HOME'] ?? '';
    final dateStr =
        '${timestamp.year}-${_pad(timestamp.month)}-${_pad(timestamp.day)}'
        '_${_pad(timestamp.hour)}-${_pad(timestamp.minute)}';

    final outputPath = '$home/Desktop/${AppConstants.outputRootFolder}/$projectName/$dateStr';

    await Directory(outputPath).create(recursive: true);
    return outputPath;
  }

  /// Creates a platform subdirectory inside the output root.
  Future<String> createPlatformSubdir(String outputRoot, String platform) async {
    final dir = '$outputRoot/$platform';
    await Directory(dir).create(recursive: true);
    return dir;
  }

  /// Copies all files from [source] directory to [destination].
  Future<void> copyDirectory(String source, String destination) async {
    final sourceDir = Directory(source);
    if (!sourceDir.existsSync()) return;

    await Directory(destination).create(recursive: true);

    await for (final entity in sourceDir.list()) {
      final newPath = '$destination/${entity.path.split(Platform.pathSeparator).last}';
      if (entity is File) {
        await entity.copy(newPath);
      } else if (entity is Directory) {
        await copyDirectory(entity.path, newPath);
      }
    }
  }

  /// Opens Finder at the given path (macOS).
  Future<void> openInFinder(String path) async {
    await Process.run('open', [path]);
  }

  String _pad(int value) => value.toString().padLeft(2, '0');
}
