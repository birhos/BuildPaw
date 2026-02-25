import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/project/project_cubit.dart';
import '../../application/project/project_state.dart';
import '../../core/theme/app_colors.dart';
import '../../core/i18n/strings.g.dart';
import 'language_selector.dart';
import 'theme_selector.dart';

class ProjectSelectorWidget extends StatelessWidget {
  const ProjectSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        final path = switch (state) {
          final ProjectLoaded s => s.info.path,
          _ => '',
        };

        final isLoading = state is ProjectLoading;
        final errorMessage = state is ProjectError ? state.message : null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.pets, color: AppColors.primary, size: 28),
                const SizedBox(width: 10),
                Text(
                  t.projectSelector.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const Spacer(),
                const ThemeSelector(),
                const LanguageSelector(),
                if (isLoading)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    readOnly: true,
                    controller: TextEditingController(text: path),
                    decoration: InputDecoration(
                      hintText: t.projectSelector.hint,
                      prefixIcon: Icon(Icons.folder_open, color: Theme.of(context).colorScheme.onSurfaceVariant),
                      errorText: errorMessage,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: isLoading ? null : () => _pickProject(context),
                  icon: const Icon(Icons.search, size: 18),
                  label: Text(t.common.browse),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickProject(BuildContext context) async {
    final dialogTitle = context.t.projectSelector.selectDialogTitle;
    final result = await FilePicker.platform.getDirectoryPath(
      dialogTitle: dialogTitle,
    );
    if (result != null && context.mounted) {
      await context.read<ProjectCubit>().selectProject(result);
    }
  }
}
