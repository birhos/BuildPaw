import 'package:equatable/equatable.dart';

import '../../core/i18n/strings.g.dart';

final class LocaleState extends Equatable {
  const LocaleState(this.locale);
  final AppLocale locale;

  @override
  List<Object?> get props => [locale];
}
