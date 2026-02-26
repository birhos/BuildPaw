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

        return IconButton(
          tooltip: t.theme.title,
          icon: Icon(
            isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 20,
          ),
          onPressed: () => context.read<ThemeCubit>().setTheme(
            isDark ? AppThemeMode.light : AppThemeMode.dark,
          ),
        );
      },
    );
  }
}
