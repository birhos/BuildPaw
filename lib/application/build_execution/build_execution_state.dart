import 'package:equatable/equatable.dart';

import '../../domain/enums/build_platform.dart';
import '../../domain/models/build_result.dart';

sealed class BuildExecutionState extends Equatable {
  const BuildExecutionState();

  @override
  List<Object?> get props => [];
}

class BuildIdle extends BuildExecutionState {
  const BuildIdle();
}

class BuildRunning extends BuildExecutionState {
  final List<LogEntry> logs;
  final BuildPlatform? currentPlatform;
  final int completedCount;
  final int totalCount;

  const BuildRunning({
    this.logs = const [],
    this.currentPlatform,
    this.completedCount = 0,
    this.totalCount = 0,
  });

  double get progress =>
      totalCount > 0 ? completedCount / totalCount : 0;

  BuildRunning copyWith({
    List<LogEntry>? logs,
    BuildPlatform? currentPlatform,
    int? completedCount,
    int? totalCount,
  }) {
    return BuildRunning(
      logs: logs ?? this.logs,
      currentPlatform: currentPlatform ?? this.currentPlatform,
      completedCount: completedCount ?? this.completedCount,
      totalCount: totalCount ?? this.totalCount,
    );
  }

  @override
  List<Object?> get props => [logs, currentPlatform, completedCount, totalCount];
}

class BuildSuccess extends BuildExecutionState {
  final List<BuildResult> results;
  final String outputPath;
  final List<LogEntry> logs;

  const BuildSuccess({
    required this.results,
    required this.outputPath,
    this.logs = const [],
  });

  @override
  List<Object?> get props => [results, outputPath, logs];
}

class BuildError extends BuildExecutionState {
  final String error;
  final List<LogEntry> logs;

  const BuildError({required this.error, this.logs = const []});

  @override
  List<Object?> get props => [error, logs];
}

class LogEntry extends Equatable {
  final String text;
  final bool isError;
  final bool isHeader;

  const LogEntry({
    required this.text,
    this.isError = false,
    this.isHeader = false,
  });

  @override
  List<Object?> get props => [text, isError, isHeader];
}
