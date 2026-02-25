import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';
import '../../infrastructure/infrastructure.dart';

final class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit({
    required GitService gitService,
    required FlutterService flutterService,
  }) : _gitService = gitService,
       _flutterService = flutterService,
       super(const ProjectInitial());
  final GitService _gitService;
  final FlutterService _flutterService;

  Future<void> selectProject(String path) async {
    emit(const ProjectLoading());

    try {
      final isValid = await _flutterService.validateProject(path);
      if (!isValid) {
        emit(const ProjectError('Invalid Flutter project. pubspec.yaml not found.'));
        return;
      }

      final results = await Future.wait([
        _flutterService.getProjectName(path),
        _flutterService.getProjectVersion(path),
        _gitService.getCurrentBranch(path),
        _flutterService.getFlutterVersion(path),
        _flutterService.getDartVersion(path),
        _gitService.getLatestTag(path),
      ]);

      final info = ProjectInfo(
        name: results[0]!,
        path: path,
        version: results[1]!,
        branch: results[2]!,
        flutterVersion: results[3]!,
        dartVersion: results[4]!,
        latestTag: results[5],
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
