import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../core/core.dart';
import '../../domain/domain.dart';
import '../pages/publish_config_page.dart';

final class PublishTabContent extends StatelessWidget {
  const PublishTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, projectState) {
        final (projectPath, projectName) = switch (projectState) {
          ProjectLoaded(:final info) => (info.path, info.name),
          _ => (null, null),
        };

        return BlocConsumer<PublishCubit, PublishState>(
          listenWhen: (prev, curr) => curr is PublishFastlaneMissing || curr is PublishConfigMissing,
          listener: (context, state) {
            if (state is PublishFastlaneMissing) {
              _showFastlaneMissingDialog(context);
            } else if (state is PublishConfigMissing) {
              _showConfigMissingDialog(context);
            }
          },
          builder: (context, publishState) {
            final isPublishing = publishState is PublishRunning;
            final isChecking = publishState is PublishCheckingFastlane;

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      t.publish.target,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    BlocBuilder<PublishProfileCubit, PublishProfileState>(
                      builder: (context, profileState) {
                        return DropdownButtonFormField<PublishTarget>(
                          initialValue: _targetNotifier.value,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                          items: PublishTarget.values
                              .map(
                                (t) => DropdownMenuItem(
                                  value: t,
                                  child: Text(_targetLabel(context, t)),
                                ),
                              )
                              .toList(),
                          onChanged: isPublishing || isChecking
                              ? null
                              : (v) {
                                  if (v != null) _targetNotifier.value = v;
                                },
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      t.publish.profile,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    BlocBuilder<PublishProfileCubit, PublishProfileState>(
                      builder: (context, profileState) {
                        final profiles = profileState.profiles;
                        return Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                initialValue: profileState.selectedProfileId,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                                hint: Text(t.publish.noProfile),
                                items: [
                                  ...profiles.map(
                                    (p) => DropdownMenuItem(
                                      value: p.id,
                                      child: Text(p.name),
                                    ),
                                  ),
                                ],
                                onChanged: isPublishing || isChecking
                                    ? null
                                    : (v) {
                                        context.read<PublishProfileCubit>().selectProfile(v);
                                      },
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Icons.settings),
                              tooltip: t.publish.configureProfile,
                              onPressed: isPublishing || isChecking ? null : () => _openConfigPage(context),
                            ),
                          ],
                        );
                      },
                    ),
                    if (_targetNotifier.value == PublishTarget.googlePlay) ...[
                      const SizedBox(height: 16),
                      Text(
                        t.publish.track,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<PlayTrack>(
                        initialValue: _playTrackNotifier.value,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                        items: PlayTrack.values
                            .map(
                              (t) => DropdownMenuItem(
                                value: t,
                                child: Text(_playTrackLabel(context, t)),
                              ),
                            )
                            .toList(),
                        onChanged: isPublishing || isChecking
                            ? null
                            : (v) {
                                if (v != null) _playTrackNotifier.value = v;
                              },
                      ),
                    ],
                    const SizedBox(height: 16),
                    BlocBuilder<LastBuildOutputCubit, LastBuildOutputState>(
                      builder: (context, lastBuildState) {
                        final hasOutput = lastBuildState.hasOutput && lastBuildState.projectPath == projectPath;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (hasOutput)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  '${t.publish.lastBuild}: ${lastBuildState.outputPath}',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.terminalSuccess,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            else if (projectPath != null)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  t.publish.noBuildOutput,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.warning,
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed:
                                _canPublish(
                                  hasProject: projectPath != null,
                                  projectPath: projectPath,
                                  isPublishing: isPublishing,
                                  isChecking: isChecking,
                                  context: context,
                                )
                                ? () => _startPublish(
                                    context,
                                    projectPath!,
                                    projectName ?? 'Unknown',
                                  )
                                : null,
                            icon: isPublishing || isChecking
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Icon(Icons.upload_rounded, size: 20),
                            label: Text(
                              isPublishing || isChecking ? '...' : t.publish.button,
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                          ),
                        ),
                        if (isPublishing || isChecking) ...[
                          const SizedBox(width: 12),
                          OutlinedButton.icon(
                            onPressed: () => context.read<PublishCubit>().stopPublish(),
                            icon: const Icon(Icons.stop, color: AppColors.error, size: 18),
                            label: Text(
                              t.publish.stop,
                              style: const TextStyle(color: AppColors.error),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: AppColors.error),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            ),
                          ),
                        ] else if (publishState is PublishError && publishState.retryable) ...[
                          const SizedBox(width: 12),
                          OutlinedButton.icon(
                            onPressed: () => context.read<PublishCubit>().reset(),
                            icon: const Icon(Icons.refresh, size: 18),
                            label: Text(t.publish.retry),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  bool _canPublish({
    required bool hasProject,
    required String? projectPath,
    required bool isPublishing,
    required bool isChecking,
    required BuildContext context,
  }) {
    if (!hasProject || projectPath == null || isPublishing || isChecking) {
      return false;
    }
    final profileState = context.read<PublishProfileCubit>().state;
    final profile = profileState.selectedProfile;
    if (profile == null) return false;
    final target = _targetNotifier.value;
    if (!profile.hasConfigFor(target)) return false;
    final lastBuild = context.read<LastBuildOutputCubit>().state;
    if (!lastBuild.hasOutput || lastBuild.projectPath != projectPath) {
      return false;
    }
    return true;
  }

  Future<void> _startPublish(
    BuildContext context,
    String projectPath,
    String projectName,
  ) async {
    final profile = context.read<PublishProfileCubit>().state.selectedProfile;
    if (profile == null) return;

    final target = _targetNotifier.value;
    final playTrack = target == PublishTarget.googlePlay ? _playTrackNotifier.value : null;

    await context.read<PublishCubit>().checkAndPublish(
      projectPath: projectPath,
      target: target,
      profile: profile,
      playTrack: playTrack,
    );
  }

  void _showFastlaneMissingDialog(BuildContext context) {
    final t = context.t;
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t.publish.fastlaneMissing),
        content: Text(t.publish.fastlaneMissingMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(t.common.cancel),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(ctx);
              await context.read<PublishCubit>().installFastlane();
            },
            child: Text(t.publish.install),
          ),
        ],
      ),
    );
  }

  void _showConfigMissingDialog(BuildContext context) {
    final t = context.t;
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t.publish.configMissing),
        content: Text(t.publish.configMissingMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(t.common.cancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<PublishCubit>().reset();
              _openConfigPage(context);
            },
            child: Text(t.publish.configureNow),
          ),
        ],
      ),
    );
  }

  Future<void> _openConfigPage(BuildContext context) async {
    final t = context.t;
    final savedName = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<PublishProfileCubit>(),
          child: const PublishConfigPage(),
        ),
      ),
    );
    if (savedName != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.profile.saveSuccess(name: savedName))),
      );
    }
  }

  String _targetLabel(BuildContext context, PublishTarget t) {
    final x = context.t;
    return switch (t) {
      PublishTarget.firebase => x.publish.firebase,
      PublishTarget.googlePlay => x.publish.googlePlay,
      PublishTarget.appStoreConnect => x.publish.appStoreConnect,
    };
  }

  String _playTrackLabel(BuildContext context, PlayTrack t) {
    final x = context.t;
    return switch (t) {
      PlayTrack.internal => x.publish.internal,
      PlayTrack.closed => x.publish.closed,
      PlayTrack.production => x.publish.production,
    };
  }
}

final _targetNotifier = ValueNotifier<PublishTarget>(PublishTarget.firebase);
final _playTrackNotifier = ValueNotifier<PlayTrack>(PlayTrack.internal);
