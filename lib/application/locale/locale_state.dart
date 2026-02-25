import 'package:equatable/equatable.dart';

import '../../core/i18n/strings.g.dart';

sealed class LocaleState extends Equatable {
  const LocaleState();

  @override
  List<Object?> get props => [];
}

final class LocaleLoaded extends LocaleState {
  const LocaleLoaded(this.locale);
  final AppLocale locale;

  @override
  List<Object?> get props => [locale];
}
