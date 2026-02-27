enum PublishTarget {
  firebase('Firebase App Distribution'),
  googlePlay('Google Play Console'),
  appStoreConnect('App Store Connect (TestFlight)');

  const PublishTarget(this.label);
  final String label;
}
