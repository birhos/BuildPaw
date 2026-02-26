import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import '../../infrastructure/infrastructure.dart';
import '../build_config/build_config_cubit.dart';
import '../build_config/build_config_state.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required ProfileStorageService storageService,
  })  : _storageService = storageService,
        super(const ProfileState());

  final ProfileStorageService _storageService;

  Future<void> loadProfiles() async {
    final profiles = await _storageService.loadProfiles();
    emit(state.copyWith(profiles: profiles));
  }

  /// Saves current build config as a new named profile.
  Future<void> saveProfile({
    required String name,
    required String version,
    required BuildConfigState configState,
  }) async {
    final preset = BuildPreset(
      name: name,
      version: version,
      exportedAt: DateTime.now(),
      enabledPlatforms: configState.enabledPlatforms,
      androidConfig: configState.androidConfig,
      iosConfig: configState.iosConfig,
      webConfig: configState.webConfig,
    );

    await _storageService.addProfile(preset);
    final profiles = await _storageService.loadProfiles();
    emit(state.copyWith(
      profiles: profiles,
      activeProfileName: () => name,
    ));
  }

  /// Overwrites an existing profile with current config.
  Future<void> updateProfile({
    required String name,
    required String version,
    required BuildConfigState configState,
  }) async {
    final preset = BuildPreset(
      name: name,
      version: version,
      exportedAt: DateTime.now(),
      enabledPlatforms: configState.enabledPlatforms,
      androidConfig: configState.androidConfig,
      iosConfig: configState.iosConfig,
      webConfig: configState.webConfig,
    );

    await _storageService.updateProfile(name, preset);
    final profiles = await _storageService.loadProfiles();
    emit(state.copyWith(profiles: profiles));
  }

  /// Loads a profile's config into the BuildConfigCubit.
  void applyProfile(String name, BuildConfigCubit configCubit) {
    final profile = state.profiles.firstWhere(
      (p) => p.name == name,
      orElse: () => throw StateError('Profile "$name" not found'),
    );

    configCubit
      ..togglePlatform(
          BuildPlatform.android,
          profile.enabledPlatforms[BuildPlatform.android] ?? false)
      ..togglePlatform(
          BuildPlatform.ios,
          profile.enabledPlatforms[BuildPlatform.ios] ?? false)
      ..togglePlatform(
          BuildPlatform.web,
          profile.enabledPlatforms[BuildPlatform.web] ?? false)
      ..updateAndroidConfig(profile.androidConfig)
      ..updateIosConfig(profile.iosConfig)
      ..updateWebConfig(profile.webConfig);

    emit(state.copyWith(activeProfileName: () => name));
  }

  Future<void> deleteProfile(String name) async {
    await _storageService.deleteProfile(name);
    final profiles = await _storageService.loadProfiles();
    emit(state.copyWith(
      profiles: profiles,
      activeProfileName: () =>
          state.activeProfileName == name ? null : state.activeProfileName,
    ));
  }

  void clearActiveProfile() {
    emit(state.copyWith(activeProfileName: () => null));
  }
}
