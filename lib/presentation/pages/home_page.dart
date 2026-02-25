import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/build_config/build_config_cubit.dart';
import '../../core/i18n/strings.g.dart';
import '../widgets/build_action_bar.dart';
import '../widgets/build_log_panel.dart';
import '../widgets/config_drop_target.dart';
import '../widgets/export_config_dialog.dart';
import '../widgets/platform_config/android_config_panel.dart';
import '../widgets/platform_config/ios_config_panel.dart';
import '../widgets/platform_config/web_config_panel.dart';
import '../widgets/project_info_card.dart';
import '../widgets/project_selector_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfigDropTarget(
      child: Scaffold(
        body: Center(
          child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            children: [
              const ProjectSelectorWidget(),
              const SizedBox(height: 12),
              const ProjectInfoCard(),
              const SizedBox(height: 8),
              const AndroidConfigPanel(),
              const IosConfigPanel(),
              const WebConfigPanel(),
              const SizedBox(height: 8),
              _ConfigActionRow(),
              const SizedBox(height: 4),
              const BuildActionBar(),
              const SizedBox(height: 4),
              const BuildLogPanel(),
              const SizedBox(height: 20),
            ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ConfigActionRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _handleExport(context),
            icon: const Icon(Icons.upload_file, size: 18),
            label: Text(t.config.export),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _handleImport(context),
            icon: const Icon(Icons.download, size: 18),
            label: Text(t.config.import),
          ),
        ),
      ],
    );
  }

  Future<void> _handleExport(BuildContext context) async {
    final result = await showDialog<({String name, String version})>(
      context: context,
      builder: (_) => const ExportConfigDialog(),
    );
    if (result == null || !context.mounted) return;

    final path = await context.read<BuildConfigCubit>().exportConfig(
          name: result.name,
          version: result.version,
        );

    if (!context.mounted) return;
    final t = context.t;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          path != null
              ? t.config.exportSuccess(path: path)
              : t.config.exportCancelled,
        ),
      ),
    );
  }

  Future<void> _handleImport(BuildContext context) async {
    final presetName =
        await context.read<BuildConfigCubit>().importConfig();

    if (!context.mounted) return;
    final t = context.t;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          presetName != null
              ? t.config.importSuccess(name: presetName)
              : t.config.importCancelled,
        ),
      ),
    );
  }
}
