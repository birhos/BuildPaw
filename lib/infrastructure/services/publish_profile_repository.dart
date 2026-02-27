import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/domain.dart';

const _profilesKey = 'buildpaw_publish_profiles';
const _secretsKeyPrefix = 'buildpaw_publish_secrets_';

final class PublishProfileRepository {
  PublishProfileRepository();

  String _secretKey(String profileId, String keyName) =>
      '$_secretsKeyPrefix${profileId}_$keyName';

  Future<List<PublishProfile>> loadProfiles() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_profilesKey);
    if (jsonStr == null || jsonStr.isEmpty) return [];

    try {
      final list = jsonDecode(jsonStr) as List<dynamic>;
      final profiles = <PublishProfile>[];
      for (final item in list) {
        profiles.add(
          PublishProfile.fromJson(item as Map<String, dynamic>),
        );
      }
      return profiles;
    } catch (_) {
      return [];
    }
  }

  Future<void> saveProfile(PublishProfile profile) async {
    final profiles = await loadProfiles();
    final index = profiles.indexWhere((p) => p.id == profile.id);
    final updated = List<PublishProfile>.from(profiles);
    if (index >= 0) {
      updated[index] = profile;
    } else {
      updated.add(profile);
    }
    await _persist(updated);
  }

  Future<void> deleteProfile(String id) async {
    await _deleteAllSecretsForProfile(id);
    final profiles = await loadProfiles();
    final updated = profiles.where((p) => p.id != id).toList();
    await _persist(updated);
  }

  Future<void> saveSecureValue(
    String profileId,
    String keyName,
    String value,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_secretKey(profileId, keyName), value);
  }

  Future<String?> loadSecureValue(String profileId, String keyName) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_secretKey(profileId, keyName));
  }

  Future<void> _deleteAllSecretsForProfile(String profileId) async {
    const keys = [
      'firebase_token',
      'asc_api_key_content',
      'fastlane_user',
      'fastlane_apple_application_specific_password',
      'asc_key_id',
      'asc_issuer_id',
      'asc_key_path',
      'asc_team_id',
    ];
    final prefs = await SharedPreferences.getInstance();
    for (final k in keys) {
      await prefs.remove(_secretKey(profileId, k));
    }
  }

  Future<void> _persist(List<PublishProfile> profiles) async {
    final prefs = await SharedPreferences.getInstance();
    final list = profiles.map((p) => p.toJson()).toList();
    await prefs.setString(_profilesKey, jsonEncode(list));
  }
}
