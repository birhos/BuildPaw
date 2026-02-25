import 'package:equatable/equatable.dart';

import '../../domain/domain.dart';

sealed class BuildExecutionEvent extends Equatable {
  const BuildExecutionEvent();

  @override
  List<Object?> get props => [];
}

final class BuildStarted extends BuildExecutionEvent {
  const BuildStarted({
    required this.projectPath,
    required this.projectName,
    required this.useFvm,
    required this.platforms,
    this.androidConfig,
    this.iosConfig,
    this.webConfig,
  });
  final String projectPath;
  final String projectName;
  final bool useFvm;
  final Set<BuildPlatform> platforms;
  final AndroidBuildConfig? androidConfig;
  final IosBuildConfig? iosConfig;
  final WebBuildConfig? webConfig;

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
  const BuildLogReceived({required this.line, this.isError = false});
  final String line;
  final bool isError;

  @override
  List<Object?> get props => [line, isError];
}

class BuildCancelled extends BuildExecutionEvent {
  const BuildCancelled();
}
