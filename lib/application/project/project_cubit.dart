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
        _flutterService.getDependencies(path),
      ]);

      final info = ProjectInfo(
        name: results[0]! as String,
        path: path,
        version: results[1]! as String,
        branch: results[2]! as String,
        flutterVersion: results[3]! as String,
        dartVersion: results[4]! as String,
        latestTag: results[5] as String?,
        hasFvm: _flutterService.hasFvm(path),
        dependencies: results[6]! as Map<String, String>,
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
