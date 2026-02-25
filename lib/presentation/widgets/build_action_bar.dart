import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../core/core.dart';
import '../../domain/domain.dart';

final class BuildActionBar extends StatelessWidget {
  const BuildActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuildExecutionBloc, BuildExecutionState>(
      builder: (context, buildState) {
        final isBuilding = buildState is BuildRunning;

        return BlocBuilder<ProjectCubit, ProjectState>(
          builder: (context, projectState) {
            return BlocBuilder<BuildConfigCubit, BuildConfigState>(
              builder: (context, configState) {
                final canBuild = projectState is ProjectLoaded &&
                    configState.hasEnabledPlatform &&
                    !isBuilding;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildButton(
                            context, canBuild, isBuilding, buildState),
                      ),
                      if (isBuilding) ...[
                        const SizedBox(width: 12),
                        OutlinedButton.icon(
                          onPressed: () => context
                              .read<BuildExecutionBloc>()
                              .add(const BuildCancelled()),
                          icon: const Icon(Icons.stop,
                              color: AppColors.error, size: 18),
                          label: Text(context.t.build.cancel,
                              style: const TextStyle(color: AppColors.error)),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.error),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 14),
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildButton(BuildContext context, bool canBuild, bool isBuilding,
      BuildExecutionState buildState) {
    if (isBuilding) {
      final running = buildState as BuildRunning;
      return ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              running.currentPlatform != null
                  ? context.t.build.buildingPlatform(
                      platform: _platformLabel(context, running.currentPlatform!),
                      completed: running.completedCount,
                      total: running.totalCount,
                    )
                  : context.t.build.building,
            ),
          ],
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: canBuild ? () => _startBuild(context) : null,
      icon: const Icon(Icons.build_rounded, size: 20),
      label: Text(context.t.build.button, style: const TextStyle(letterSpacing: 1.5)),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  String _platformLabel(BuildContext context, BuildPlatform platform) {
    final t = context.t;
    return switch (platform) {
      BuildPlatform.android => t.platforms.android,
      BuildPlatform.ios => t.platforms.ios,
      BuildPlatform.web => t.platforms.web,
    };
  }

  void _startBuild(BuildContext context) {
    final projectState = context.read<ProjectCubit>().state;
    final configState = context.read<BuildConfigCubit>().state;

    if (projectState is! ProjectLoaded) return;

    final info = projectState.info;
    final platforms = configState.activePlatforms;

    context.read<BuildExecutionBloc>().add(BuildStarted(
          projectPath: info.path,
          projectName: info.name,
          useFvm: info.hasFvm,
          platforms: platforms,
          androidConfig: platforms.contains(BuildPlatform.android)
              ? configState.androidConfig
              : null,
          iosConfig: platforms.contains(BuildPlatform.ios)
              ? configState.iosConfig
              : null,
          webConfig: platforms.contains(BuildPlatform.web)
              ? configState.webConfig
              : null,
        ));
  }
}
