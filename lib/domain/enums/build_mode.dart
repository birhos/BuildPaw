enum BuildMode {
  debug('Debug', '--debug'),
  profile('Profile', '--profile'),
  release('Release', '--release');

  const BuildMode(this.label, this.flag);
  final String label;
  final String flag;
}
