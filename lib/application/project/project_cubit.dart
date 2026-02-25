import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/project_info.dart';
import '../../infrastructure/services/flutter_service.dart';
import '../../infrastructure/services/git_service.dart';
import 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  final GitService _gitService;
  final FlutterService _flutterService;

  ProjectCubit({
    required GitService gitService,
    required FlutterService flutterService,
  })  : _gitService = gitService,
        _flutterService = flutterService,
        super(const ProjectInitial());

  Future<void> selectProject(String path) async {
    emit(const ProjectLoading());

    try {
      final isValid = await _flutterService.validateProject(path);
      if (!isValid) {
        emit(const ProjectError(
            'Invalid Flutter project. pubspec.yaml not found.'));
        return;
      }

      final results = await Future.wait([
        _flutterService.getProjectName(path),
        _gitService.getCurrentBranch(path),
        _flutterService.getFlutterVersion(path),
        _flutterService.getDartVersion(path),
      ]);

      final info = ProjectInfo(
        name: results[0],
        path: path,
        branch: results[1],
        flutterVersion: results[2],
        dartVersion: results[3],
        hasFvm: _flutterService.hasFvm(path),
      );

      emit(ProjectLoaded(info));
    } catch (e) {
      emit(ProjectError('Failed to load project: $e'));
    }
  }

  void reset() {
    emit(const ProjectInitial());
  }
}
