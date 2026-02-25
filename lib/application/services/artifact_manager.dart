import 'dart:io';

import 'package:buildpaw/core/constants/app_constants.dart';
import 'package:buildpaw/domain/enums/android_output_type.dart';
import 'package:buildpaw/domain/enums/build_platform.dart';
import 'package:buildpaw/domain/models/android_build_config.dart';
import 'package:buildpaw/infrastructure/services/file_system_service.dart';

class ArtifactManager {
  final FileSystemService _fileSystemService;

  ArtifactManager(this._fileSystemService);

  /// Collects artifacts for all built platforms and returns the output root path.
  Future<String> collectArtifacts({
    required String projectPath,
    required String projectName,
    required Set<BuildPlatform> platforms,
    AndroidBuildConfig? androidConfig,
  }) async {
    final outputRoot = await _fileSystemService.createOutputDirectory(
      projectName: projectName,
      timestamp: DateTime.now(),
    );

    for (final platform in platforms) {
      switch (platform) {
        case BuildPlatform.android:
          await _collectAndroid(projectPath, outputRoot, androidConfig);
        case BuildPlatform.ios:
          await _collectIos(projectPath, outputRoot);
        case BuildPlatform.web:
          await _collectWeb(projectPath, outputRoot);
      }
    }

    return outputRoot;
  }

  Future<void> _collectAndroid(
    String projectPath,
    String outputRoot,
    AndroidBuildConfig? config,
  ) async {
    final destDir =
        await _fileSystemService.createPlatformSubdir(outputRoot, 'android');

    if (config == null ||
        config.outputType == AndroidOutputType.apk ||
        config.outputType == AndroidOutputType.both) {
      final apkSource =
          '$projectPath/${AppConstants.androidApkOutputPath}';
      if (Directory(apkSource).existsSync()) {
        await _fileSystemService.copyDirectory(apkSource, '$destDir/apk');
      }
    }

    if (config == null ||
        config.outputType == AndroidOutputType.aab ||
        config.outputType == AndroidOutputType.both) {
      final aabSource =
          '$projectPath/${AppConstants.androidAabOutputPath}';
      if (Directory(aabSource).existsSync()) {
        await _fileSystemService.copyDirectory(aabSource, '$destDir/aab');
      }
    }
  }

  Future<void> _collectIos(String projectPath, String outputRoot) async {
    final destDir =
        await _fileSystemService.createPlatformSubdir(outputRoot, 'ios');
    final source = '$projectPath/${AppConstants.iosIpaOutputPath}';
    if (Directory(source).existsSync()) {
      await _fileSystemService.copyDirectory(source, destDir);
    }
  }

  Future<void> _collectWeb(String projectPath, String outputRoot) async {
    final destDir =
        await _fileSystemService.createPlatformSubdir(outputRoot, 'web');
    final source = '$projectPath/${AppConstants.webOutputPath}';
    if (Directory(source).existsSync()) {
      await _fileSystemService.copyDirectory(source, destDir);
    }
  }

  Future<void> openOutputInFinder(String outputPath) async {
    await _fileSystemService.openInFinder(outputPath);
  }
}
