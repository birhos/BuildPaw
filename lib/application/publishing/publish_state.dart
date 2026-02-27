import 'package:equatable/equatable.dart';

import '../../domain/domain.dart';

sealed class PublishState extends Equatable {
  const PublishState();

  @override
  List<Object?> get props => [];
}

final class PublishIdle extends PublishState {
  const PublishIdle();
}

final class PublishCheckingFastlane extends PublishState {
  const PublishCheckingFastlane();
}

final class PublishFastlaneMissing extends PublishState {
  const PublishFastlaneMissing();
}

final class PublishConfigMissing extends PublishState {
  const PublishConfigMissing();
}

final class PublishReady extends PublishState {
  const PublishReady();
}

final class PublishRunning extends PublishState {
  const PublishRunning({
    this.logs = const [],
    this.target,
  });
  final List<PublishLogEntry> logs;
  final PublishTarget? target;

  PublishRunning copyWith({
    List<PublishLogEntry>? logs,
    PublishTarget? target,
  }) =>
      PublishRunning(
        logs: logs ?? this.logs,
        target: target ?? this.target,
      );

  @override
  List<Object?> get props => [logs, target];
}

final class PublishSuccess extends PublishState {
  const PublishSuccess({this.logs = const []});
  final List<PublishLogEntry> logs;

  @override
  List<Object?> get props => [logs];
}

final class PublishError extends PublishState {
  const PublishError({
    required this.message,
    this.logs = const [],
    this.retryable = true,
  });
  final String message;
  final List<PublishLogEntry> logs;
  final bool retryable;

  @override
  List<Object?> get props => [message, logs, retryable];
}

final class PublishLogEntry extends Equatable {
  const PublishLogEntry({
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
