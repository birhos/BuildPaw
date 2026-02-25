import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/build_config/build_config_cubit.dart';
import '../../../application/build_config/build_config_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/enums/build_mode.dart';
import '../../../domain/enums/build_platform.dart';
import '../../../domain/enums/ios_output_type.dart';

class IosConfigPanel extends StatelessWidget {
  const IosConfigPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuildConfigCubit, BuildConfigState>(
      builder: (context, state) {
        final enabled = state.enabledPlatforms[BuildPlatform.ios] ?? false;
        final config = state.iosConfig;
        final cubit = context.read<BuildConfigCubit>();

        return Card(
          child: ExpansionTile(
            leading: Icon(
              Icons.apple,
              color: enabled ? AppColors.info : AppColors.onSurfaceVariant,
            ),
            title: Row(
              children: [
                const Text('iOS'),
                const Spacer(),
                Switch(
                  value: enabled,
                  onChanged: (v) => cubit.togglePlatform(BuildPlatform.ios, v),
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
                      const _SectionLabel('Output Type'),
                      const SizedBox(height: 4),
                      RadioGroup<IosOutputType>(
                        groupValue: config.outputType,
                        onChanged: (v) => cubit.updateIosConfig(config.copyWith(outputType: v)),
                        child: Column(
                          children: IosOutputType.values
                              .map(
                                (type) => RadioListTile<IosOutputType>(
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
                        subtitle: const Text('--obfuscate', style: _flagStyle),
                        value: config.obfuscate,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (v) => cubit.updateIosConfig(config.copyWith(obfuscate: v)),
                      ),
                      CheckboxListTile(
                        title: const Text('Split Debug Info'),
                        subtitle: const Text('--split-debug-info=build/symbols', style: _flagStyle),
                        value: config.splitDebugInfo,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (v) => cubit.updateIosConfig(config.copyWith(splitDebugInfo: v)),
                      ),
                      const Divider(),
                      const _SectionLabel('Flavor'),
                      const SizedBox(height: 4),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'e.g. dev, staging, prod',
                          isDense: true,
                        ),
                        controller: TextEditingController(text: config.flavor),
                        onChanged: (v) => cubit.updateIosConfig(config.copyWith(flavor: v)),
                      ),
                      const SizedBox(height: 12),
                      const _SectionLabel('Run Mode'),
                      const SizedBox(height: 4),
                      RadioGroup<BuildMode>(
                        groupValue: config.buildMode,
                        onChanged: (v) => cubit.updateIosConfig(config.copyWith(buildMode: v)),
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
                      const _SectionLabel('Target'),
                      const SizedBox(height: 4),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'lib/main.dart',
                          isDense: true,
                        ),
                        controller: TextEditingController(text: config.target),
                        onChanged: (v) => cubit.updateIosConfig(config.copyWith(target: v)),
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
  const _SectionLabel(this.text);
  final String text;

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
