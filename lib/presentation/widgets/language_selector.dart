import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/locale/locale_cubit.dart';
import '../../application/locale/locale_state.dart';
import '../../core/theme/app_colors.dart';
import '../../i18n/strings.g.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        final currentLocale = state is LocaleLoaded ? state.locale : AppLocale.en;
        return PopupMenuButton<AppLocale>(
          tooltip: t.language.title,
          icon: Icon(
            Icons.language,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 22,
          ),
          onSelected: (locale) =>
              context.read<LocaleCubit>().setLocale(locale),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: AppLocale.en,
              child: Row(
                children: [
                  if (currentLocale == AppLocale.en)
                    const Icon(Icons.check, size: 18, color: AppColors.primary),
                  if (currentLocale == AppLocale.en) const SizedBox(width: 8),
                  Text(t.language.english),
                ],
              ),
            ),
            PopupMenuItem(
              value: AppLocale.tr,
              child: Row(
                children: [
                  if (currentLocale == AppLocale.tr)
                    const Icon(Icons.check, size: 18, color: AppColors.primary),
                  if (currentLocale == AppLocale.tr) const SizedBox(width: 8),
                  Text(t.language.turkish),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
