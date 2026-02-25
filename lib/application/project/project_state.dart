import 'package:equatable/equatable.dart';

import '../../domain/models/project_info.dart';

sealed class ProjectState extends Equatable {
  const ProjectState();

  @override
  List<Object?> get props => [];
}

final class ProjectInitial extends ProjectState {
  const ProjectInitial();
}

final class ProjectLoading extends ProjectState {
  const ProjectLoading();
}

final class ProjectLoaded extends ProjectState {
  const ProjectLoaded(this.info);
  final ProjectInfo info;

  @override
  List<Object?> get props => [info];
}

final class ProjectError extends ProjectState {
  const ProjectError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
