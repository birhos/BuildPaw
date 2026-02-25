enum WebRenderer {
  html('HTML', 'html'),
  canvaskit('CanvasKit', 'canvaskit'),
  auto('Auto', 'auto');

  const WebRenderer(this.label, this.value);
  final String label;
  final String value;
}
