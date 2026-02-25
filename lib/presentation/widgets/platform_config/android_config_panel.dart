import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/build_config/build_config_cubit.dart';
import '../../../application/build_config/build_config_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/enums/android_output_type.dart';
import '../../../domain/enums/build_mode.dart';
import '../../../domain/enums/build_platform.dart';
import '../../../i18n/strings.g.dart';

class AndroidConfigPanel extends StatelessWidget {
  const AndroidConfigPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return BlocBuilder<BuildConfigCubit, BuildConfigState>(
      builder: (context, state) {
        final enabled = state.enabledPlatforms[BuildPlatform.android] ?? false;
        final config = state.androidConfig;
        final cubit = context.read<BuildConfigCubit>();

        return Card(
          child: ExpansionTile(
            leading: Icon(
              Icons.android,
              color: enabled ? AppColors.success : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            title: Row(
              children: [
                Text(t.platforms.android),
                const Spacer(),
                Switch(
                  value: enabled,
                  onChanged: (v) => cubit.togglePlatform(BuildPlatform.android, v),
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
                      _SectionLabel(t.platformConfig.outputType),
                      const SizedBox(height: 4),
                      RadioGroup<AndroidOutputType>(
                        groupValue: config.outputType,
                        onChanged: (v) => cubit.updateAndroidConfig(config.copyWith(outputType: v)),
                        child: Column(
                          children: AndroidOutputType.values
                              .map(
                                (type) => RadioListTile<AndroidOutputType>(
                                  title: Text(_androidOutputLabel(t, type)),
                                  value: type,
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const Divider(),
                      CheckboxListTile(
                        title: Text(t.platformConfig.codeObfuscation),
                        subtitle: Text('--obfuscate', style: _flagStyle(context)),
                        value: config.obfuscate,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (v) => cubit.updateAndroidConfig(config.copyWith(obfuscate: v)),
                      ),
                      CheckboxListTile(
                        title: Text(t.platformConfig.splitDebugInfo),
                        subtitle: Text('--split-debug-info=build/symbols', style: _flagStyle(context)),
                        value: config.splitDebugInfo,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (v) => cubit.updateAndroidConfig(config.copyWith(splitDebugInfo: v)),
                      ),
                      const Divider(),
                      _SectionLabel(t.platformConfig.flavor),
                      const SizedBox(height: 4),
                      TextField(
                        decoration: InputDecoration(
                          hintText: t.platformConfig.flavorHint,
                          isDense: true,
                        ),
                        controller: TextEditingController(text: config.flavor),
                        onChanged: (v) => cubit.updateAndroidConfig(config.copyWith(flavor: v)),
                      ),
                      const SizedBox(height: 12),
                      _SectionLabel(t.platformConfig.runMode),
                      const SizedBox(height: 4),
                      RadioGroup<BuildMode>(
                        groupValue: config.buildMode,
                        onChanged: (v) => cubit.updateAndroidConfig(config.copyWith(buildMode: v)),
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
                      TextField(
                        decoration: InputDecoration(
                          hintText: t.platformConfig.targetHint,
                          isDense: true,
                        ),
                        controller: TextEditingController(text: config.target),
                        onChanged: (v) => cubit.updateAndroidConfig(config.copyWith(target: v)),
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

String _androidOutputLabel(Translations t, AndroidOutputType type) {
  return switch (type) {
    AndroidOutputType.apk => t.androidOutput.apk,
    AndroidOutputType.aab => t.androidOutput.aab,
    AndroidOutputType.both => t.androidOutput.both,
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
