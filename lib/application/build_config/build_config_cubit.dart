import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/enums/build_platform.dart';
import '../../domain/models/android_build_config.dart';
import '../../domain/models/build_preset.dart';
import '../../domain/models/ios_build_config.dart';
import '../../domain/models/web_build_config.dart';
import 'build_config_state.dart';

class BuildConfigCubit extends Cubit<BuildConfigState> {
  BuildConfigCubit() : super(const BuildConfigState());

  void togglePlatform(BuildPlatform platform, bool enabled) {
    final updated = Map<BuildPlatform, bool>.from(state.enabledPlatforms);
    updated[platform] = enabled;
    emit(state.copyWith(enabledPlatforms: updated));
  }

  void updateAndroidConfig(AndroidBuildConfig config) {
    emit(state.copyWith(androidConfig: config));
  }

  void updateIosConfig(IosBuildConfig config) {
    emit(state.copyWith(iosConfig: config));
  }

  void updateWebConfig(WebBuildConfig config) {
    emit(state.copyWith(webConfig: config));
  }

  void reset() {
    emit(const BuildConfigState());
  }

  /// Exports the current config as a versioned JSON preset file.
  /// Returns the saved file path, or null if cancelled.
  Future<String?> exportConfig({
    required String name,
    required String version,
  }) async {
    final preset = BuildPreset(
      name: name,
      version: version,
      exportedAt: DateTime.now(),
      enabledPlatforms: state.enabledPlatforms,
      androidConfig: state.androidConfig,
      iosConfig: state.iosConfig,
      webConfig: state.webConfig,
    );

    final jsonString =
        const JsonEncoder.withIndent('  ').convert(preset.toJson());

    final savePath = await FilePicker.platform.saveFile(
      dialogTitle: 'Export Build Config',
      fileName: '${name.replaceAll(' ', '_').toLowerCase()}_v$version.json',
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (savePath == null) return null;

    final file = File(savePath);
    await file.writeAsString(jsonString);
    return savePath;
  }

  /// Imports a JSON preset file and applies it to the current state.
  /// Returns the preset name on success, or null if cancelled/failed.
  Future<String?> importConfig() async {
    final result = await FilePicker.platform.pickFiles(
      dialogTitle: 'Import Build Config',
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result == null || result.files.isEmpty) return null;

    final filePath = result.files.single.path;
    if (filePath == null) return null;

    try {
      final content = await File(filePath).readAsString();
      final json = jsonDecode(content) as Map<String, dynamic>;
      final preset = BuildPreset.fromJson(json);

      emit(BuildConfigState(
        enabledPlatforms: preset.enabledPlatforms,
        androidConfig: preset.androidConfig,
        iosConfig: preset.iosConfig,
        webConfig: preset.webConfig,
      ));

      return '${preset.name} v${preset.version}';
    } catch (_) {
      return null;
    }
  }
}
