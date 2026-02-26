import 'package:equatable/equatable.dart';

import '../../domain/domain.dart';

final class ProfileState extends Equatable {
  const ProfileState({
    this.profiles = const [],
    this.activeProfileName,
  });

  final List<BuildPreset> profiles;
  final String? activeProfileName;

  BuildPreset? get activeProfile {
    if (activeProfileName == null) return null;
    final index = profiles.indexWhere((p) => p.name == activeProfileName);
    return index != -1 ? profiles[index] : null;
  }

  ProfileState copyWith({
    List<BuildPreset>? profiles,
    String? Function()? activeProfileName,
  }) {
    return ProfileState(
      profiles: profiles ?? this.profiles,
      activeProfileName: activeProfileName != null
          ? activeProfileName()
          : this.activeProfileName,
    );
  }

  @override
  List<Object?> get props => [profiles, activeProfileName];
}
