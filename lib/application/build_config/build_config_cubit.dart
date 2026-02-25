import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/enums/build_platform.dart';
import '../../domain/models/android_build_config.dart';
import '../../domain/models/ios_build_config.dart';
import '../../domain/models/web_build_config.dart';
import 'build_config_state.dart';

class BuildConfigCubit extends Cubit<BuildConfigState> {
  BuildConfigCubit() : super(const BuildConfigState());

  void togglePlatform(BuildPlatform platform, bool enabled) {
    final updated = Map<BuildPlatform, bool>.from(state.enabledPlatforms);
    updated[platform] = enabled;
    emit(state.copyWith(enabledPlatforms: updated));
  }

  void updateAndroidConfig(AndroidBuildConfig config) {
    emit(state.copyWith(androidConfig: config));
  }

  void updateIosConfig(IosBuildConfig config) {
    emit(state.copyWith(iosConfig: config));
  }

  void updateWebConfig(WebBuildConfig config) {
    emit(state.copyWith(webConfig: config));
  }

  void reset() {
    emit(const BuildConfigState());
  }
}
