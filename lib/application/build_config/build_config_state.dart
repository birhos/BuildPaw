import 'package:equatable/equatable.dart';

import '../../domain/enums/build_platform.dart';
import '../../domain/models/android_build_config.dart';
import '../../domain/models/ios_build_config.dart';
import '../../domain/models/web_build_config.dart';

final class BuildConfigState extends Equatable {
  const BuildConfigState({
    this.enabledPlatforms = const {
      BuildPlatform.android: false,
      BuildPlatform.ios: false,
      BuildPlatform.web: false,
    },
    this.androidConfig = const AndroidBuildConfig(),
    this.iosConfig = const IosBuildConfig(),
    this.webConfig = const WebBuildConfig(),
  });
  final Map<BuildPlatform, bool> enabledPlatforms;
  final AndroidBuildConfig androidConfig;
  final IosBuildConfig iosConfig;
  final WebBuildConfig webConfig;

  bool get hasEnabledPlatform => enabledPlatforms.values.any((enabled) => enabled);

  Set<BuildPlatform> get activePlatforms => enabledPlatforms.entries.where((e) => e.value).map((e) => e.key).toSet();

  BuildConfigState copyWith({
    Map<BuildPlatform, bool>? enabledPlatforms,
    AndroidBuildConfig? androidConfig,
    IosBuildConfig? iosConfig,
    WebBuildConfig? webConfig,
  }) {
    return BuildConfigState(
      enabledPlatforms: enabledPlatforms ?? this.enabledPlatforms,
      androidConfig: androidConfig ?? this.androidConfig,
      iosConfig: iosConfig ?? this.iosConfig,
      webConfig: webConfig ?? this.webConfig,
    );
  }

  @override
  List<Object?> get props => [
    enabledPlatforms,
    androidConfig,
    iosConfig,
    webConfig,
  ];
}
