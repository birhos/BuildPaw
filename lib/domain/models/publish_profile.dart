import 'package:equatable/equatable.dart';

import '../enums/play_track.dart';
import '../enums/publish_target.dart';

final class PublishProfile extends Equatable {
  const PublishProfile({
    required this.id,
    required this.name,
    required this.createdAt,
    this.firebaseAppId,
    this.firebaseTesterGroups = const [],
    this.playPackageName,
    this.playServiceAccountJsonPath,
    this.playTrack = PlayTrack.internal,
    this.ascBundleId,
    this.ascAppleId,
    this.ascTeamId,
    this.ascItcTeamId,
    this.ascApiKeyId,
    this.ascIssuerId,
    this.ascApiKeyPath,
  });

  factory PublishProfile.fromJson(Map<String, dynamic> json) {
    final groups = json['firebaseTesterGroups'] as List<dynamic>?;
    return PublishProfile(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? 'Unnamed',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : DateTime.now(),
      firebaseAppId: json['firebaseAppId'] as String?,
      firebaseTesterGroups: groups?.map((e) => e as String).toList() ?? const [],
      playPackageName: json['playPackageName'] as String?,
      playServiceAccountJsonPath: json['playServiceAccountJsonPath'] as String?,
      playTrack: PlayTrack.values.byName(
        json['playTrack'] as String? ?? PlayTrack.internal.name,
      ),
      ascBundleId: json['ascBundleId'] as String?,
      ascAppleId: json['ascAppleId'] as String?,
      ascTeamId: json['ascTeamId'] as String?,
      ascItcTeamId: json['ascItcTeamId'] as String?,
      ascApiKeyId: json['ascApiKeyId'] as String?,
      ascIssuerId: json['ascIssuerId'] as String?,
      ascApiKeyPath: json['ascApiKeyPath'] as String?,
    );
  }

  final String id;
  final String name;
  final DateTime createdAt;

  // Firebase
  final String? firebaseAppId;
  final List<String> firebaseTesterGroups;

  // Google Play
  final String? playPackageName;
  final String? playServiceAccountJsonPath;
  final PlayTrack playTrack;

  // App Store Connect
  final String? ascBundleId;
  final String? ascAppleId;
  final String? ascTeamId;
  final String? ascItcTeamId;
  final String? ascApiKeyId;
  final String? ascIssuerId;
  final String? ascApiKeyPath;

  bool hasConfigFor(PublishTarget target) {
    return switch (target) {
      PublishTarget.firebase => firebaseAppId != null && firebaseAppId!.isNotEmpty,
      PublishTarget.googlePlay =>
        playPackageName != null &&
            playPackageName!.isNotEmpty &&
            playServiceAccountJsonPath != null &&
            playServiceAccountJsonPath!.isNotEmpty,
      PublishTarget.appStoreConnect => _hasAscConfig,
    };
  }

  bool get _hasAscConfig {
    if (ascBundleId == null || ascBundleId!.isEmpty) return false;
    final hasAppleIdAuth = ascAppleId != null && ascAppleId!.isNotEmpty && ascTeamId != null && ascTeamId!.isNotEmpty;
    final hasApiKeyAuth =
        ascApiKeyId != null &&
        ascApiKeyId!.isNotEmpty &&
        ascIssuerId != null &&
        ascIssuerId!.isNotEmpty &&
        ascApiKeyPath != null &&
        ascApiKeyPath!.isNotEmpty;
    return hasAppleIdAuth || hasApiKeyAuth;
  }

  PublishProfile copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    String? firebaseAppId,
    List<String>? firebaseTesterGroups,
    String? playPackageName,
    String? playServiceAccountJsonPath,
    PlayTrack? playTrack,
    String? ascBundleId,
    String? ascAppleId,
    String? ascTeamId,
    String? ascItcTeamId,
    String? ascApiKeyId,
    String? ascIssuerId,
    String? ascApiKeyPath,
  }) {
    return PublishProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      firebaseAppId: firebaseAppId ?? this.firebaseAppId,
      firebaseTesterGroups: firebaseTesterGroups ?? this.firebaseTesterGroups,
      playPackageName: playPackageName ?? this.playPackageName,
      playServiceAccountJsonPath: playServiceAccountJsonPath ?? this.playServiceAccountJsonPath,
      playTrack: playTrack ?? this.playTrack,
      ascBundleId: ascBundleId ?? this.ascBundleId,
      ascAppleId: ascAppleId ?? this.ascAppleId,
      ascTeamId: ascTeamId ?? this.ascTeamId,
      ascItcTeamId: ascItcTeamId ?? this.ascItcTeamId,
      ascApiKeyId: ascApiKeyId ?? this.ascApiKeyId,
      ascIssuerId: ascIssuerId ?? this.ascIssuerId,
      ascApiKeyPath: ascApiKeyPath ?? this.ascApiKeyPath,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'createdAt': createdAt.toIso8601String(),
    'firebaseAppId': firebaseAppId,
    'firebaseTesterGroups': firebaseTesterGroups,
    'playPackageName': playPackageName,
    'playServiceAccountJsonPath': playServiceAccountJsonPath,
    'playTrack': playTrack.name,
    'ascBundleId': ascBundleId,
    'ascAppleId': ascAppleId,
    'ascTeamId': ascTeamId,
    'ascItcTeamId': ascItcTeamId,
    'ascApiKeyId': ascApiKeyId,
    'ascIssuerId': ascIssuerId,
    'ascApiKeyPath': ascApiKeyPath,
  };

  @override
  List<Object?> get props => [
    id,
    name,
    createdAt,
    firebaseAppId,
    firebaseTesterGroups,
    playPackageName,
    playServiceAccountJsonPath,
    playTrack,
    ascBundleId,
    ascAppleId,
    ascTeamId,
    ascItcTeamId,
    ascApiKeyId,
    ascIssuerId,
    ascApiKeyPath,
  ];
}
