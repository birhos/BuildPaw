import 'package:equatable/equatable.dart';

enum AppThemeMode {
  dark,
  light,
}

final class ThemeState extends Equatable {
  const ThemeState(this.mode);
  final AppThemeMode mode;

  @override
  List<Object?> get props => [mode];

  bool get isDark => mode == AppThemeMode.dark;
  bool get isLight => mode == AppThemeMode.light;
}
