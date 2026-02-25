import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/project/project_cubit.dart';
import '../../application/project/project_state.dart';
import '../../core/theme/app_colors.dart';

class ProjectSelectorWidget extends StatelessWidget {
  const ProjectSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        final path = switch (state) {
          ProjectLoaded s => s.info.path,
          _ => '',
        };

        final isLoading = state is ProjectLoading;
        final errorMessage =
            state is ProjectError ? state.message : null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.pets, color: AppColors.primary, size: 28),
                const SizedBox(width: 10),
                Text(
                  'BuildPaw',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurface,
                      ),
                ),
                const Spacer(),
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
                      hintText: 'Select a Flutter project directory...',
                      prefixIcon: const Icon(Icons.folder_open,
                          color: AppColors.onSurfaceVariant),
                      errorText: errorMessage,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: isLoading ? null : () => _pickProject(context),
                  icon: const Icon(Icons.search, size: 18),
                  label: const Text('Browse'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickProject(BuildContext context) async {
    final result = await FilePicker.platform.getDirectoryPath(
      dialogTitle: 'Select Flutter Project',
    );
    if (result != null && context.mounted) {
      context.read<ProjectCubit>().selectProject(result);
    }
  }
}
