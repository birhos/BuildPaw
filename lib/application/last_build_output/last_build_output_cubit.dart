import 'package:flutter_bloc/flutter_bloc.dart';

final class LastBuildOutputCubit extends Cubit<LastBuildOutputState> {
  LastBuildOutputCubit() : super(const LastBuildOutputState());

  void setLastBuild({
    required String outputPath,
    required String projectName,
    required String projectPath,
  }) {
    emit(LastBuildOutputState(
      outputPath: outputPath,
      projectName: projectName,
      projectPath: projectPath,
    ));
  }

  void clear() {
    emit(const LastBuildOutputState());
  }
}

final class LastBuildOutputState {
  const LastBuildOutputState({
    this.outputPath,
    this.projectName,
    this.projectPath,
  });

  final String? outputPath;
  final String? projectName;
  final String? projectPath;

  bool get hasOutput =>
      outputPath != null &&
      outputPath!.isNotEmpty &&
      projectPath != null &&
      projectPath!.isNotEmpty;
}
