import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/theme/theme_cubit.dart';
import '../../application/theme/theme_state.dart';
import '../../core/theme/app_colors.dart';
import '../../core/i18n/strings.g.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final currentMode = state is ThemeLoaded ? state.mode : AppThemeMode.dark;
        return PopupMenuButton<AppThemeMode>(
          tooltip: t.theme.title,
          icon: Icon(
            currentMode == AppThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 22,
          ),
          onSelected: (mode) => context.read<ThemeCubit>().setTheme(mode),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: AppThemeMode.dark,
              child: Row(
                children: [
                  if (currentMode == AppThemeMode.dark)
                    const Icon(Icons.check, size: 18, color: AppColors.primary),
                  if (currentMode == AppThemeMode.dark) const SizedBox(width: 8),
                  Text(t.theme.dark),
                ],
              ),
            ),
            PopupMenuItem(
              value: AppThemeMode.light,
              child: Row(
                children: [
                  if (currentMode == AppThemeMode.light)
                    const Icon(Icons.check, size: 18, color: AppColors.primary),
                  if (currentMode == AppThemeMode.light) const SizedBox(width: 8),
                  Text(t.theme.light),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
