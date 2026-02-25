enum AndroidOutputType {
  apk('Only APK', 'apk'),
  aab('Only AAB', 'appbundle'),
  both('APK & AAB', 'both');

  const AndroidOutputType(this.label, this.command);
  final String label;
  final String command;
}
