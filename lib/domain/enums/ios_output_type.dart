enum IosOutputType {
  ios('iOS (Runner.app)', 'ios'),
  ipa('IPA (Exportable)', 'ipa');

  const IosOutputType(this.label, this.command);
  final String label;
  final String command;
}
