import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../core/core.dart';
import '../../domain/domain.dart';

final class ProjectInfoCard extends StatefulWidget {
  const ProjectInfoCard({super.key});

  @override
  State<ProjectInfoCard> createState() => _ProjectInfoCardState();
}

class _ProjectInfoCardState extends State<ProjectInfoCard>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final theme = Theme.of(context);

    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        if (state is! ProjectLoaded) return const SizedBox.shrink();

        final info = state.info;
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                child: Row(
                  children: [
                    Text(
                      t.projectInfo.title,
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.refresh_rounded, size: 18),
                      color: theme.colorScheme.onSurfaceVariant,
                      tooltip: t.projectInfo.refreshTooltip,
                      splashRadius: 16,
                      onPressed: () => context
                          .read<ProjectCubit>()
                          .selectProject(info.path),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                  labelColor: AppColors.primary,
                  unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                  indicatorColor: AppColors.primary,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 2.5,
                  dividerHeight: 0.5,
                  dividerColor: theme.colorScheme.outlineVariant,
                  labelPadding:
                      const EdgeInsets.symmetric(horizontal: 14),
                  tabs: [
                    Tab(
                      height: 36,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.info_outline_rounded, size: 14),
                          const SizedBox(width: 6),
                          Text(t.projectInfo.generalTab),
                        ],
                      ),
                    ),
                    Tab(
                      height: 36,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.inventory_2_outlined, size: 14),
                          const SizedBox(width: 6),
                          Text(
                            '${t.projectInfo.dependenciesTab} (${info.dependencies.length})',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedBuilder(
                animation: _tabController,
                builder: (context, _) {
                  return AnimatedCrossFade(
                    duration: const Duration(milliseconds: 200),
                    crossFadeState: _tabController.index == 0
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: _GeneralTab(info: info),
                    secondChild: _DependenciesTab(
                      dependencies: info.dependencies,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _GeneralTab extends StatelessWidget {
  const _GeneralTab({required this.info});
  final ProjectInfo info;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 10,
        runSpacing: 8,
        children: [
          _InfoChip(
            icon: Icons.code_rounded,
            label: info.name,
            color: AppColors.primary,
          ),
          _InfoChip(
            icon: Icons.tag_rounded,
            label: 'v${info.version}',
            color: AppColors.warning,
          ),
          _InfoChip(
            icon: Icons.account_tree_rounded,
            label: info.branch,
            color: AppColors.info,
          ),
          if (info.latestTag != null)
            _InfoChip(
              icon: Icons.label_outline_rounded,
              label: info.latestTag!,
              color: AppColors.onSurface,
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
          _FvmChip(
            info: info,
            fvmActive: t.projectInfo.fvmActive,
            fvmInactive: t.projectInfo.fvmInactive,
          ),
        ],
      ),
    );
  }
}

class _DependenciesTab extends StatelessWidget {
  const _DependenciesTab({required this.dependencies});
  final Map<String, String> dependencies;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final theme = Theme.of(context);

    if (dependencies.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Text(
            t.projectInfo.noDependencies,
            style: TextStyle(
              color: theme.colorScheme.onSurfaceVariant,
              fontSize: 13,
            ),
          ),
        ),
      );
    }

    final sorted = dependencies.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    t.projectInfo.package.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    t.projectInfo.version.toUpperCase(),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          ...sorted.map(
            (entry) => _DependencyRow(
              name: entry.key,
              version: entry.value,
              isEven: sorted.indexOf(entry).isEven,
            ),
          ),
        ],
      ),
    );
  }
}

class _DependencyRow extends StatelessWidget {
  const _DependencyRow({
    required this.name,
    required this.version,
    required this.isEven,
  });
  final String name;
  final String version;
  final bool isEven;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isEven
            ? theme.colorScheme.surfaceContainerHighest
                .withValues(alpha: 0.3)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Icon(
            Icons.extension_rounded,
            size: 14,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Text(
              name,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          Expanded(
            child: Text(
              version,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.label,
    required this.color,
  });
  final IconData icon;
  final String label;
  final Color color;

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
  const _FvmChip({
    required this.info,
    required this.fvmActive,
    required this.fvmInactive,
  });
  final ProjectInfo info;
  final String fvmActive;
  final String fvmInactive;

  @override
  Widget build(BuildContext context) {
    final color =
        info.hasFvm ? AppColors.success : AppColors.onSurfaceVariant;
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
            info.hasFvm ? fvmActive : fvmInactive,
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
