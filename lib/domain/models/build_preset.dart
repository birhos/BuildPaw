import 'package:equatable/equatable.dart';

import '../../core/constants/app_constants.dart';
import '../enums/build_platform.dart';
import 'android_build_config.dart';
import 'ios_build_config.dart';
import 'web_build_config.dart';

class BuildPreset extends Equatable {
  const BuildPreset({
    required this.name,
    required this.version,
    required this.exportedAt,
    required this.enabledPlatforms,
    required this.androidConfig,
    required this.iosConfig,
    required this.webConfig,
    this.buildPawVersion = AppConstants.appVersion,
  });

  factory BuildPreset.fromJson(Map<String, dynamic> json) {
    final info = json['info'] as Map<String, dynamic>? ?? {};
    final platforms = json['platforms'] as Map<String, dynamic>? ?? {};

    return BuildPreset(
      name: info['name'] as String? ?? 'Unnamed',
      version: info['version'] as String? ?? '1.0.0',
      exportedAt: info['exportedAt'] != null ? DateTime.parse(info['exportedAt'] as String) : DateTime.now(),
      buildPawVersion: info['buildPawVersion'] as String? ?? AppConstants.appVersion,
      enabledPlatforms: {
        BuildPlatform.android: (platforms['android'] as Map<String, dynamic>?)?['enabled'] as bool? ?? false,
        BuildPlatform.ios: (platforms['ios'] as Map<String, dynamic>?)?['enabled'] as bool? ?? false,
        BuildPlatform.web: (platforms['web'] as Map<String, dynamic>?)?['enabled'] as bool? ?? false,
      },
      androidConfig: json['android'] != null
          ? AndroidBuildConfig.fromJson(json['android'] as Map<String, dynamic>)
          : const AndroidBuildConfig(),
      iosConfig: json['ios'] != null
          ? IosBuildConfig.fromJson(json['ios'] as Map<String, dynamic>)
          : const IosBuildConfig(),
      webConfig: json['web'] != null
          ? WebBuildConfig.fromJson(json['web'] as Map<String, dynamic>)
          : const WebBuildConfig(),
    );
  }
  final String name;
  final String version;
  final DateTime exportedAt;
  final String buildPawVersion;
  final Map<BuildPlatform, bool> enabledPlatforms;
  final AndroidBuildConfig androidConfig;
  final IosBuildConfig iosConfig;
  final WebBuildConfig webConfig;

  Map<String, dynamic> toJson() => {
    'info': {
      'name': name,
      'version': version,
      'exportedAt': exportedAt.toIso8601String(),
      'buildPawVersion': buildPawVersion,
    },
    'platforms': {
      'android': {'enabled': enabledPlatforms[BuildPlatform.android] ?? false},
      'ios': {'enabled': enabledPlatforms[BuildPlatform.ios] ?? false},
      'web': {'enabled': enabledPlatforms[BuildPlatform.web] ?? false},
    },
    'android': androidConfig.toJson(),
    'ios': iosConfig.toJson(),
    'web': webConfig.toJson(),
  };

  @override
  List<Object?> get props => [
    name,
    version,
    exportedAt,
    buildPawVersion,
    enabledPlatforms,
    androidConfig,
    iosConfig,
    webConfig,
  ];
}
