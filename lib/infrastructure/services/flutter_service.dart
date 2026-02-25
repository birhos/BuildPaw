import 'dart:io';

import 'process_service.dart';

class FlutterService {
  final ProcessService _processService;

  FlutterService(this._processService);

  /// Returns the flutter executable, preferring FVM if detected.
  String flutterExecutable(String projectPath) {
    if (hasFvm(projectPath)) {
      return 'fvm';
    }
    return 'flutter';
  }

  /// Returns the command arguments prefix for flutter, handling FVM.
  List<String> flutterPrefix(String projectPath) {
    if (hasFvm(projectPath)) {
      return ['flutter'];
    }
    return [];
  }

  String dartExecutable(String projectPath) {
    if (hasFvm(projectPath)) {
      return 'fvm';
    }
    return 'dart';
  }

  List<String> dartPrefix(String projectPath) {
    if (hasFvm(projectPath)) {
      return ['dart'];
    }
    return [];
  }

  bool hasFvm(String projectPath) {
    return Directory('$projectPath/.fvm').existsSync();
  }

  Future<bool> validateProject(String path) async {
    final pubspec = File('$path/pubspec.yaml');
    return pubspec.existsSync();
  }

  Future<String> getProjectName(String path) async {
    final pubspec = File('$path/pubspec.yaml');
    if (!pubspec.existsSync()) return 'Unknown';

    final lines = await pubspec.readAsLines();
    for (final line in lines) {
      if (line.startsWith('name:')) {
        return line.substring(5).trim();
      }
    }
    return 'Unknown';
  }

  Future<String> getFlutterVersion(String projectPath) async {
    try {
      final exec = flutterExecutable(projectPath);
      final prefix = flutterPrefix(projectPath);

      final result = await _processService.runAndCapture(executable: exec, arguments: [...prefix, '--version', '--machine'], workingDirectory: projectPath);

      final versionMatch = RegExp(r'"frameworkVersion"\s*:\s*"([^"]+)"').firstMatch(result);
      if (versionMatch != null) {
        return versionMatch.group(1)!;
      }

      // Fallback: parse non-machine output
      final fallback = await _processService.runAndCapture(executable: exec, arguments: [...prefix, '--version'], workingDirectory: projectPath);
      final match = RegExp(r'Flutter\s+(\S+)').firstMatch(fallback);
      return match?.group(1) ?? 'unknown';
    } catch (_) {
      return 'unknown';
    }
  }

  Future<String> getDartVersion(String projectPath) async {
    try {
      final exec = dartExecutable(projectPath);
      final prefix = dartPrefix(projectPath);

      final result = await _processService.runAndCapture(executable: exec, arguments: [...prefix, '--version'], workingDirectory: projectPath);
      final match = RegExp(r'Dart SDK version:\s*(\S+)').firstMatch(result);
      return match?.group(1) ?? 'unknown';
    } catch (_) {
      return 'unknown';
    }
  }
}
