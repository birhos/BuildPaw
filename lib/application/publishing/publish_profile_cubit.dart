import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/publish_profile.dart';
import '../../infrastructure/infrastructure.dart';
import 'publish_profile_state.dart';

final class PublishProfileCubit extends Cubit<PublishProfileState> {
  PublishProfileCubit({
    required PublishProfileRepository repository,
  })  : _repository = repository,
        super(const PublishProfileState());

  final PublishProfileRepository _repository;

  Future<void> loadProfiles() async {
    final profiles = await _repository.loadProfiles();
    emit(state.copyWith(profiles: profiles));
  }

  Future<void> saveProfile(PublishProfile profile) async {
    await _repository.saveProfile(profile);
    await loadProfiles();
  }

  Future<void> saveSecureValue(
    String profileId,
    String keyName,
    String value,
  ) async {
    await _repository.saveSecureValue(profileId, keyName, value);
  }

  Future<void> deleteProfile(String id) async {
    await _repository.deleteProfile(id);
    await loadProfiles();
    if (state.selectedProfileId == id) {
      emit(state.copyWith(selectedProfileId: () => null));
    }
  }

  void selectProfile(String? id) {
    emit(state.copyWith(selectedProfileId: () => id));
  }
}
