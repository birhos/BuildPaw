import 'package:equatable/equatable.dart';

import '../../domain/models/publish_profile.dart';

final class PublishProfileState extends Equatable {
  const PublishProfileState({
    this.profiles = const [],
    this.selectedProfileId,
  });

  final List<PublishProfile> profiles;
  final String? selectedProfileId;

  PublishProfile? get selectedProfile {
    if (selectedProfileId == null) return null;
    try {
      return profiles.firstWhere(
        (p) => p.id == selectedProfileId,
      );
    } catch (_) {
      return null;
    }
  }

  PublishProfileState copyWith({
    List<PublishProfile>? profiles,
    String? Function()? selectedProfileId,
  }) =>
      PublishProfileState(
        profiles: profiles ?? this.profiles,
        selectedProfileId:
            selectedProfileId != null ? selectedProfileId() : this.selectedProfileId,
      );

  @override
  List<Object?> get props => [profiles, selectedProfileId];
}
