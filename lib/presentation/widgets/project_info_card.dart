import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/project/project_cubit.dart';
import '../../application/project/project_state.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/models/project_info.dart';

class ProjectInfoCard extends StatelessWidget {
  const ProjectInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        if (state is! ProjectLoaded) return const SizedBox.shrink();

        final info = state.info;
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Project Info',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    _InfoChip(
                      icon: Icons.code,
                      label: info.name,
                      color: AppColors.primary,
                    ),
                    _InfoChip(
                      icon: Icons.account_tree,
                      label: info.branch,
                      color: AppColors.info,
                    ),
                    _InfoChip(
                      icon: Icons.flutter_dash,
                      label: 'Flutter ${info.flutterVersion}',
                      color: AppColors.primaryLight,
                    ),
                    _InfoChip(
                      icon: Icons.diamond_outlined,
                      label: 'Dart ${info.dartVersion}',
                      color: AppColors.success,
                    ),
                    _FvmChip(info: info),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _FvmChip extends StatelessWidget {
  final ProjectInfo info;

  const _FvmChip({required this.info});

  @override
  Widget build(BuildContext context) {
    final color = info.hasFvm ? AppColors.success : AppColors.onSurfaceVariant;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            info.hasFvm ? Icons.check_circle : Icons.cancel_outlined,
            size: 16,
            color: color,
          ),
          const SizedBox(width: 6),
          Text(
            info.hasFvm ? 'FVM Active' : 'No FVM',
            style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
