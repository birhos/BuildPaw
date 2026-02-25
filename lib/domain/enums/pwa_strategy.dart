enum PwaStrategy {
  defaultStrategy('Default', 'offline-first'),
  none('None', 'none');

  const PwaStrategy(this.label, this.value);
  final String label;
  final String value;
}
