import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../application/application.dart';
import '../../core/core.dart';

const _localeKey = 'app_locale';

final class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const LocaleState(AppLocale.en));

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_localeKey);
    final locale = AppLocale.values.where((l) => l.languageCode == saved).firstOrNull ?? AppLocale.en;
    await LocaleSettings.setLocale(locale);
    emit(LocaleState(locale));
  }

  Future<void> setLocale(AppLocale locale) async {
    await LocaleSettings.setLocale(locale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
    emit(LocaleState(locale));
  }
}
