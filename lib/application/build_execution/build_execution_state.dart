import 'package:equatable/equatable.dart';

import '../../domain/domain.dart';

sealed class BuildExecutionState extends Equatable {
  const BuildExecutionState();

  @override
  List<Object?> get props => [];
}

final class BuildIdle extends BuildExecutionState {
  const BuildIdle();
}

final class BuildRunning extends BuildExecutionState {
  const BuildRunning({
    this.logs = const [],
    this.currentPlatform,
    this.completedCount = 0,
    this.totalCount = 0,
  });
  final List<LogEntry> logs;
  final BuildPlatform? currentPlatform;
  final int completedCount;
  final int totalCount;

  double get progress => totalCount > 0 ? completedCount / totalCount : 0;

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
  const BuildSuccess({
    required this.results,
    required this.outputPath,
    this.logs = const [],
    this.projectPath = '',
    this.projectName = '',
  });
  final List<BuildResult> results;
  final String outputPath;
  final List<LogEntry> logs;
  final String projectPath;
  final String projectName;

  @override
  List<Object?> get props => [results, outputPath, logs, projectPath, projectName];
}

class BuildError extends BuildExecutionState {
  const BuildError({required this.error, this.logs = const []});
  final String error;
  final List<LogEntry> logs;

  @override
  List<Object?> get props => [error, logs];
}

class LogEntry extends Equatable {
  const LogEntry({
    required this.text,
    this.isError = false,
    this.isHeader = false,
  });
  final String text;
  final bool isError;
  final bool isHeader;

  @override
  List<Object?> get props => [text, isError, isHeader];
}
