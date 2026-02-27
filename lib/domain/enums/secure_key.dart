enum SecureKey {
  firebaseAppId('firebase_app_id'),
  firebaseToken('firebase_token'),
  packageName('package_name'),
  googlePlayJsonKey('google_play_json_key'),
  fastlaneUser('fastlane_user'),
  fastlaneAppleApplicationSpecificPassword('fastlane_apple_application_specific_password'),
  ascKeyId('asc_key_id'),
  ascIssuerId('asc_issuer_id'),
  ascKeyPath('asc_key_path'),
  ascTeamId('asc_team_id'),
  appIdentifier('app_identifier');

  const SecureKey(this.key);
  final String key;
}
