import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/application.dart';
import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../debounced_text_field.dart';

final class WebConfigPanel extends StatelessWidget {
  const WebConfigPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return BlocBuilder<BuildConfigCubit, BuildConfigState>(
      builder: (context, state) {
        final enabled = state.enabledPlatforms[BuildPlatform.web] ?? false;
        final config = state.webConfig;
        final cubit = context.read<BuildConfigCubit>();

        return Card(
          child: ExpansionTile(
            leading: Icon(
              Icons.language,
              color: enabled ? AppColors.primaryLight : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            title: Row(
              children: [
                Text(t.platforms.web),
                const Spacer(),
                Switch(
                  value: enabled,
                  onChanged: (v) => cubit.togglePlatform(BuildPlatform.web, v),
                ),
              ],
            ),
            initiallyExpanded: enabled,
            children: [
              if (enabled)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionLabel(t.platformConfig.pwaStrategy),
                      const SizedBox(height: 4),
                      DropdownButtonFormField<PwaStrategy>(
                        initialValue: config.pwaStrategy,
                        isExpanded: true,
                        decoration: const InputDecoration(isDense: true),
                        items: PwaStrategy.values
                            .map(
                              (s) => DropdownMenuItem(
                                value: s,
                                child: Text(_pwaStrategyLabel(t, s)),
                              ),
                            )
                            .toList(),
                        onChanged: (v) => cubit.updateWebConfig(config.copyWith(pwaStrategy: v)),
                      ),
                      const Divider(),
                      CheckboxListTile(
                        title: Text(t.platformConfig.noTreeShakeIcons),
                        subtitle: Text('--no-tree-shake-icons', style: _flagStyle(context)),
                        value: config.noTreeShakeIcons,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (v) => cubit.updateWebConfig(config.copyWith(noTreeShakeIcons: v)),
                      ),
                      const Divider(),
                      _SectionLabel(t.platformConfig.flavor),
                      const SizedBox(height: 4),
                      DebouncedTextField(
                        initialValue: config.flavor,
                        hintText: t.platformConfig.flavorHint,
                        textDirection: TextDirection.ltr,
                        onChanged: (v) =>
                            cubit.updateWebConfig(config.copyWith(flavor: v)),
                      ),
                      const SizedBox(height: 12),
                      _SectionLabel(t.platformConfig.runMode),
                      const SizedBox(height: 4),
                      RadioGroup<BuildMode>(
                        groupValue: config.buildMode,
                        onChanged: (v) => cubit.updateWebConfig(config.copyWith(buildMode: v)),
                        child: Column(
                          children: BuildMode.values
                              .map(
                                (mode) => RadioListTile<BuildMode>(
                                  title: Text(_buildModeLabel(t, mode)),
                                  subtitle: Text(mode.flag, style: _flagStyle(context)),
                                  value: mode,
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const Divider(),
                      _SectionLabel(t.platformConfig.target),
                      const SizedBox(height: 4),
                      DebouncedTextField(
                        initialValue: config.target,
                        hintText: t.platformConfig.targetHint,
                        textDirection: TextDirection.ltr,
                        onChanged: (v) =>
                            cubit.updateWebConfig(config.copyWith(target: v)),
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

String _pwaStrategyLabel(Translations t, PwaStrategy s) {
  return switch (s) {
    PwaStrategy.defaultStrategy => t.pwaStrategy.kDefault,
    PwaStrategy.none => t.pwaStrategy.none,
  };
}

String _buildModeLabel(Translations t, BuildMode mode) {
  return switch (mode) {
    BuildMode.debug => t.buildMode.debug,
    BuildMode.profile => t.buildMode.profile,
    BuildMode.release => t.buildMode.release,
  };
}

TextStyle _flagStyle(BuildContext context) => TextStyle(
  fontSize: 12,
  color: Theme.of(context).colorScheme.onSurfaceVariant,
  fontFamily: 'monospace',
);

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
