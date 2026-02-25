import 'package:equatable/equatable.dart';

enum AppThemeMode {
  dark,
  light,
}

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object?> get props => [];
}

final class ThemeLoaded extends ThemeState {
  const ThemeLoaded(this.mode);
  final AppThemeMode mode;

  @override
  List<Object?> get props => [mode];
}
