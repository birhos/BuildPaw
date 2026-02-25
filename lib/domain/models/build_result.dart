import 'package:equatable/equatable.dart';

import '../enums/build_platform.dart';

class BuildResult extends Equatable {
  const BuildResult({
    required this.platform,
    required this.success,
    required this.duration,
    this.outputPath,
    this.logs = const [],
  });
  final BuildPlatform platform;
  final bool success;
  final String? outputPath;
  final Duration duration;
  final List<String> logs;

  @override
  List<Object?> get props => [platform, success, outputPath, duration, logs];
}
