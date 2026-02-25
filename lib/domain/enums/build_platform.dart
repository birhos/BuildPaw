enum BuildPlatform {
  android('Android', '🤖'),
  ios('iOS', '🍎'),
  web('Web', '🌍');

  const BuildPlatform(this.label, this.icon);
  final String label;
  final String icon;
}
