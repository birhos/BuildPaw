import 'dart:io';

import 'process_service.dart';

final class FlutterService {
  FlutterService(this._processService);
  final ProcessService _processService;

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

  Future<String> getProjectVersion(String path) async {
    final pubspec = File('$path/pubspec.yaml');
    if (!pubspec.existsSync()) return 'unknown';

    final lines = await pubspec.readAsLines();
    for (final line in lines) {
      if (line.startsWith('version:')) {
        return line.substring(8).trim();
      }
    }
    return 'unknown';
  }

  Future<Map<String, String>> getDependencies(String path) async {
    final pubspec = File('$path/pubspec.yaml');
    if (!pubspec.existsSync()) return {};

    final yamlDeps = await _parsePubspecYamlDeps(pubspec);
    if (yamlDeps.isEmpty) return {};

    final lockFile = File('$path/pubspec.lock');
    if (!lockFile.existsSync()) return yamlDeps;

    final lockVersions = await _parseLockFileVersions(lockFile);

    return yamlDeps.map((name, yamlVersion) {
      final resolved = lockVersions[name];
      return MapEntry(name, resolved ?? yamlVersion);
    });
  }

  Future<Map<String, String>> _parsePubspecYamlDeps(File pubspec) async {
    final lines = await pubspec.readAsLines();
    final deps = <String, String>{};
    var inDeps = false;
    var inDevDeps = false;
    const sdkPackages = {'flutter', 'flutter_test', 'flutter_localizations'};
    const metaKeys = {'sdk', 'path', 'git', 'url', 'ref'};

    for (final line in lines) {
      final trimmed = line.trimLeft();
      final stripped = line.trim();

      if (stripped == 'dependencies:') {
        inDeps = true;
        inDevDeps = false;
        continue;
      }
      if (stripped == 'dev_dependencies:') {
        inDevDeps = true;
        inDeps = false;
        continue;
      }
      if (stripped.isNotEmpty &&
          !stripped.startsWith(' ') &&
          !stripped.startsWith('#') &&
          stripped == trimmed &&
          stripped.endsWith(':')) {
        inDeps = false;
        inDevDeps = false;
        continue;
      }

      if (!inDeps && !inDevDeps) continue;
      if (trimmed.startsWith('#') || trimmed.isEmpty) continue;

      if (trimmed.contains(':')) {
        final colonIdx = trimmed.indexOf(':');
        final key = trimmed.substring(0, colonIdx).trim();
        if (metaKeys.contains(key) || sdkPackages.contains(key)) continue;
        if (key.isEmpty) continue;

        final value = trimmed.substring(colonIdx + 1).trim();
        deps[key] = value.isEmpty ? 'any' : value;
      }
    }

    return deps;
  }

  Future<Map<String, String>> _parseLockFileVersions(File lockFile) async {
    final lines = await lockFile.readAsLines();
    final versions = <String, String>{};
    String? currentPackage;

    for (final line in lines) {
      if (line.startsWith('  ') && !line.startsWith('    ') && line.trimRight().endsWith(':')) {
        currentPackage = line.trim().replaceAll(':', '');
      } else if (currentPackage != null && line.trimLeft().startsWith('version:')) {
        final raw = line.trimLeft().substring(8).trim();
        versions[currentPackage] = raw.replaceAll('"', '').replaceAll("'", '');
        currentPackage = null;
      }
    }

    return versions;
  }

  Future<String> getFlutterVersion(String projectPath) async {
    try {
      final exec = flutterExecutable(projectPath);
      final prefix = flutterPrefix(projectPath);

      final result = await _processService.runAndCapture(
        executable: exec,
        arguments: [...prefix, '--version', '--machine'],
        workingDirectory: projectPath,
      );

      final versionMatch = RegExp(r'"frameworkVersion"\s*:\s*"([^"]+)"').firstMatch(result);
      if (versionMatch != null) {
        return versionMatch.group(1)!;
      }

      // Fallback: parse non-machine output
      final fallback = await _processService.runAndCapture(
        executable: exec,
        arguments: [...prefix, '--version'],
        workingDirectory: projectPath,
      );
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

      final result = await _processService.runAndCapture(
        executable: exec,
        arguments: [...prefix, '--version'],
        workingDirectory: projectPath,
      );
      final match = RegExp(r'Dart SDK version:\s*(\S+)').firstMatch(result);
      return match?.group(1) ?? 'unknown';
    } catch (_) {
      return 'unknown';
    }
  }
}
