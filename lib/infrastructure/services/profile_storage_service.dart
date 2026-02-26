import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/domain.dart';

class ProfileStorageService {
  static const _profilesKey = 'buildpaw_profiles';

  Future<List<BuildPreset>> loadProfiles() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_profilesKey);
    if (raw == null || raw.isEmpty) return [];

    return raw.map((jsonStr) {
      final map = jsonDecode(jsonStr) as Map<String, dynamic>;
      return BuildPreset.fromJson(map);
    }).toList();
  }

  Future<void> saveProfiles(List<BuildPreset> profiles) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = profiles
        .map((p) => jsonEncode(p.toJson()))
        .toList();
    await prefs.setStringList(_profilesKey, raw);
  }

  Future<void> addProfile(BuildPreset profile) async {
    final profiles = await loadProfiles();
    profiles.add(profile);
    await saveProfiles(profiles);
  }

  Future<void> deleteProfile(String name) async {
    final profiles = await loadProfiles();
    profiles.removeWhere((p) => p.name == name);
    await saveProfiles(profiles);
  }

  Future<void> updateProfile(String oldName, BuildPreset updated) async {
    final profiles = await loadProfiles();
    final index = profiles.indexWhere((p) => p.name == oldName);
    if (index != -1) {
      profiles[index] = updated;
    } else {
      profiles.add(updated);
    }
    await saveProfiles(profiles);
  }
}
