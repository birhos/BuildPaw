import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../core/core.dart';

final class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        final currentLocale = state.locale;

        return PopupMenuButton<AppLocale>(
          tooltip: t.language.title,
          icon: Icon(
            Icons.translate_rounded,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 20,
          ),
          onSelected: (locale) =>
              context.read<LocaleCubit>().setLocale(locale),
          position: PopupMenuPosition.under,
          constraints: const BoxConstraints(minWidth: 160),
          itemBuilder: (_) => [
            _buildItem(
              flag: 'EN',
              label: t.language.english,
              value: AppLocale.en,
              isSelected: currentLocale == AppLocale.en,
              context: context,
            ),
            _buildItem(
              flag: 'TR',
              label: t.language.turkish,
              value: AppLocale.tr,
              isSelected: currentLocale == AppLocale.tr,
              context: context,
            ),
          ],
        );
      },
    );
  }

  PopupMenuItem<AppLocale> _buildItem({
    required String flag,
    required String label,
    required AppLocale value,
    required bool isSelected,
    required BuildContext context,
  }) {
    return PopupMenuItem<AppLocale>(
      value: value,
      height: 40,
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: Text(
              flag,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: isSelected
                    ? AppColors.primary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected
                    ? AppColors.primary
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          if (isSelected)
            const Icon(Icons.check_rounded, size: 16, color: AppColors.primary),
        ],
      ),
    );
  }
}
