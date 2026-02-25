import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/build_config/build_config_cubit.dart';
import '../../../application/build_config/build_config_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/enums/android_output_type.dart';
import '../../../domain/enums/build_mode.dart';
import '../../../domain/enums/build_platform.dart';

class AndroidConfigPanel extends StatelessWidget {
  const AndroidConfigPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuildConfigCubit, BuildConfigState>(
      builder: (context, state) {
        final enabled =
            state.enabledPlatforms[BuildPlatform.android] ?? false;
        final config = state.androidConfig;
        final cubit = context.read<BuildConfigCubit>();

        return Card(
          child: ExpansionTile(
            leading: Icon(
              Icons.android,
              color: enabled ? AppColors.success : AppColors.onSurfaceVariant,
            ),
            title: Row(
              children: [
                const Text('Android'),
                const Spacer(),
                Switch(
                  value: enabled,
                  onChanged: (v) =>
                      cubit.togglePlatform(BuildPlatform.android, v),
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
                      _SectionLabel('Output Type'),
                      const SizedBox(height: 4),
                      RadioGroup<AndroidOutputType>(
                        groupValue: config.outputType,
                        onChanged: (v) => cubit.updateAndroidConfig(
                            config.copyWith(outputType: v)),
                        child: Column(
                          children: AndroidOutputType.values
                              .map(
                                (type) => RadioListTile<AndroidOutputType>(
                                  title: Text(type.label),
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
                        title: const Text('Code Obfuscation'),
                        subtitle:
                            const Text('--obfuscate', style: _flagStyle),
                        value: config.obfuscate,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (v) => cubit.updateAndroidConfig(
                            config.copyWith(obfuscate: v)),
                      ),
                      CheckboxListTile(
                        title: const Text('Split Debug Info'),
                        subtitle: const Text(
                            '--split-debug-info=build/symbols',
                            style: _flagStyle),
                        value: config.splitDebugInfo,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (v) => cubit.updateAndroidConfig(
                            config.copyWith(splitDebugInfo: v)),
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
                        onChanged: (v) => cubit.updateAndroidConfig(
                            config.copyWith(flavor: v)),
                      ),
                      const SizedBox(height: 12),
                      _SectionLabel('Run Mode'),
                      const SizedBox(height: 4),
                      RadioGroup<BuildMode>(
                        groupValue: config.buildMode,
                        onChanged: (v) => cubit.updateAndroidConfig(
                            config.copyWith(buildMode: v)),
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
                        onChanged: (v) => cubit.updateAndroidConfig(
                            config.copyWith(target: v)),
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
