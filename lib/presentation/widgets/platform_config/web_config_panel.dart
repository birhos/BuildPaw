import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/build_config/build_config_cubit.dart';
import '../../../application/build_config/build_config_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/enums/build_mode.dart';
import '../../../domain/enums/build_platform.dart';
import '../../../domain/enums/pwa_strategy.dart';

class WebConfigPanel extends StatelessWidget {
  const WebConfigPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuildConfigCubit, BuildConfigState>(
      builder: (context, state) {
        final enabled = state.enabledPlatforms[BuildPlatform.web] ?? false;
        final config = state.webConfig;
        final cubit = context.read<BuildConfigCubit>();

        return Card(
          child: ExpansionTile(
            leading: Icon(
              Icons.language,
              color: enabled
                  ? AppColors.primaryLight
                  : AppColors.onSurfaceVariant,
            ),
            title: Row(
              children: [
                const Text('Web'),
                const Spacer(),
                Switch(
                  value: enabled,
                  onChanged: (v) =>
                      cubit.togglePlatform(BuildPlatform.web, v),
                ),
              ],
            ),
            initiallyExpanded: enabled,
            children: [
              if (enabled)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionLabel('PWA Strategy'),
                      const SizedBox(height: 4),
                      DropdownButtonFormField<PwaStrategy>(
                        initialValue: config.pwaStrategy,
                        isExpanded: true,
                        decoration: const InputDecoration(isDense: true),
                        items: PwaStrategy.values
                            .map((s) => DropdownMenuItem(
                                  value: s,
                                  child: Text(s.label),
                                ))
                            .toList(),
                        onChanged: (v) => cubit.updateWebConfig(
                            config.copyWith(pwaStrategy: v)),
                      ),
                      const Divider(),
                      CheckboxListTile(
                        title: const Text('No Tree Shake Icons'),
                        subtitle: const Text('--no-tree-shake-icons',
                            style: _flagStyle),
                        value: config.noTreeShakeIcons,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (v) => cubit.updateWebConfig(
                            config.copyWith(noTreeShakeIcons: v)),
                      ),
                      const Divider(),
                      _SectionLabel('Flavor'),
                      const SizedBox(height: 4),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'e.g. dev, staging, prod',
                          isDense: true,
                        ),
                        controller:
                            TextEditingController(text: config.flavor),
                        onChanged: (v) => cubit
                            .updateWebConfig(config.copyWith(flavor: v)),
                      ),
                      const SizedBox(height: 12),
                      _SectionLabel('Run Mode'),
                      const SizedBox(height: 4),
                      RadioGroup<BuildMode>(
                        groupValue: config.buildMode,
                        onChanged: (v) => cubit
                            .updateWebConfig(config.copyWith(buildMode: v)),
                        child: Column(
                          children: BuildMode.values
                              .map(
                                (mode) => RadioListTile<BuildMode>(
                                  title: Text(mode.label),
                                  subtitle: Text(mode.flag, style: _flagStyle),
                                  value: mode,
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const Divider(),
                      _SectionLabel('Target'),
                      const SizedBox(height: 4),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'lib/main.dart',
                          isDense: true,
                        ),
                        controller:
                            TextEditingController(text: config.target),
                        onChanged: (v) => cubit
                            .updateWebConfig(config.copyWith(target: v)),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

const _flagStyle = TextStyle(
  fontSize: 12,
  color: AppColors.onSurfaceVariant,
  fontFamily: 'monospace',
);

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
