enum PlayTrack {
  internal('internal'),
  closed('closed'),
  production('production');

  const PlayTrack(this.value);
  final String value;
}
