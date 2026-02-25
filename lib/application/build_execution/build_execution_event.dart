import 'package:equatable/equatable.dart';

import '../../domain/enums/build_platform.dart';
import '../../domain/models/android_build_config.dart';
import '../../domain/models/ios_build_config.dart';
import '../../domain/models/web_build_config.dart';

sealed class BuildExecutionEvent extends Equatable {
  const BuildExecutionEvent();

  @override
  List<Object?> get props => [];
}

class BuildStarted extends BuildExecutionEvent {
  final String projectPath;
  final String projectName;
  final bool useFvm;
  final Set<BuildPlatform> platforms;
  final AndroidBuildConfig? androidConfig;
  final IosBuildConfig? iosConfig;
  final WebBuildConfig? webConfig;

  const BuildStarted({
    required this.projectPath,
    required this.projectName,
    required this.useFvm,
    required this.platforms,
    this.androidConfig,
    this.iosConfig,
    this.webConfig,
  });

  @override
  List<Object?> get props => [
        projectPath,
        projectName,
        useFvm,
        platforms,
        androidConfig,
        iosConfig,
        webConfig,
      ];
}

class BuildLogReceived extends BuildExecutionEvent {
  final String line;
  final bool isError;

  const BuildLogReceived({required this.line, this.isError = false});

  @override
  List<Object?> get props => [line, isError];
}

class BuildCancelled extends BuildExecutionEvent {
  const BuildCancelled();
}
