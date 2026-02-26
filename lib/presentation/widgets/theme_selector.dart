import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../core/core.dart';

final class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDark = state.isDark;
        final currentMode =
            isDark ? AppThemeMode.dark : AppThemeMode.light;

        return PopupMenuButton<AppThemeMode>(
          tooltip: t.theme.title,
          icon: Icon(
            isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 20,
          ),
          onSelected: (mode) =>
              context.read<ThemeCubit>().setTheme(mode),
          position: PopupMenuPosition.under,
          constraints: const BoxConstraints(minWidth: 160),
          itemBuilder: (_) => [
            _buildItem(
              icon: Icons.dark_mode_rounded,
              label: t.theme.dark,
              value: AppThemeMode.dark,
              isSelected: currentMode == AppThemeMode.dark,
              context: context,
            ),
            _buildItem(
              icon: Icons.light_mode_rounded,
              label: t.theme.light,
              value: AppThemeMode.light,
              isSelected: currentMode == AppThemeMode.light,
              context: context,
            ),
          ],
        );
      },
    );
  }

  PopupMenuItem<AppThemeMode> _buildItem({
    required IconData icon,
    required String label,
    required AppThemeMode value,
    required bool isSelected,
    required BuildContext context,
  }) {
    return PopupMenuItem<AppThemeMode>(
      value: value,
      height: 40,
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: isSelected
                ? AppColors.primary
                : Theme.of(context).colorScheme.onSurfaceVariant,
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
