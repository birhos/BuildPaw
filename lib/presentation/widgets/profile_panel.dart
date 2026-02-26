import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../core/core.dart';
import 'save_profile_dialog.dart';

class ProfileSelector extends StatelessWidget {
  const ProfileSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final hasActive = state.activeProfileName != null;
        return PopupMenuButton<String>(
          tooltip: context.t.profile.title,
          icon: Icon(
            hasActive ? Icons.person_rounded : Icons.person_outline_rounded,
            color: hasActive ? AppColors.primary : Theme.of(context).colorScheme.onSurfaceVariant,
            size: 20,
          ),
          onSelected: (value) => _onSelected(context, value, state),
          position: PopupMenuPosition.under,
          constraints: const BoxConstraints(minWidth: 220),
          itemBuilder: (_) => _buildItems(context, state),
        );
      },
    );
  }

  List<PopupMenuEntry<String>> _buildItems(
    BuildContext context,
    ProfileState state,
  ) {
    final t = context.t;
    final theme = Theme.of(context);
    final items = <PopupMenuEntry<String>>[];

    if (state.profiles.isNotEmpty) {
      items.add(
        PopupMenuItem<String>(
          enabled: false,
          height: 32,
          child: Text(
            t.profile.title.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      );

      for (final profile in state.profiles) {
        final isActive = profile.name == state.activeProfileName;
        items.add(
          PopupMenuItem<String>(
            value: 'apply:${profile.name}',
            height: 44,
            child: Row(
              children: [
                Icon(
                  isActive ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
                  size: 16,
                  color: isActive ? AppColors.primary : theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        profile.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                          color: isActive ? AppColors.primary : theme.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        'v${profile.version}',
                        style: TextStyle(
                          fontSize: 11,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.pop(context, 'delete:${profile.name}'),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      Icons.close_rounded,
                      size: 14,
                      color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      items.add(const PopupMenuDivider(height: 8));
    }

    if (state.activeProfileName != null) {
      items.add(
        PopupMenuItem<String>(
          value: 'save',
          height: 40,
          child: Row(
            children: [
              Icon(
                Icons.save_rounded,
                size: 16,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 10),
              Text(
                t.profile.saveProfile,
                style: TextStyle(
                  fontSize: 13,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      );
    }

    items.add(
      PopupMenuItem<String>(
        value: 'new',
        height: 40,
        child: Row(
          children: [
            const Icon(
              Icons.add_rounded,
              size: 16,
              color: AppColors.primary,
            ),
            const SizedBox(width: 10),
            Text(
              t.profile.newProfile,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );

    return items;
  }

  void _onSelected(
    BuildContext context,
    String value,
    ProfileState state,
  ) {
    if (value == 'new') {
      _newProfile(context);
    } else if (value == 'save') {
      _saveActive(context, state);
    } else if (value.startsWith('delete:')) {
      _deleteProfile(context, value.substring(7));
    } else if (value.startsWith('apply:')) {
      _applyProfile(context, value.substring(6));
    }
  }

  void _applyProfile(BuildContext context, String name) {
    context.read<ProfileCubit>().applyProfile(
      name,
      context.read<BuildConfigCubit>(),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.t.profile.applied(name: name))),
    );
  }

  Future<void> _saveActive(BuildContext context, ProfileState state) async {
    final active = state.activeProfile;
    if (active == null) return;

    await context.read<ProfileCubit>().updateProfile(
      name: active.name,
      version: active.version,
      configState: context.read<BuildConfigCubit>().state,
    );

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.t.profile.saveSuccess(name: active.name)),
      ),
    );
  }

  Future<void> _deleteProfile(BuildContext context, String name) async {
    final t = context.t;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(t.common.delete),
        content: Text(t.profile.deleteConfirm(name: name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(t.common.cancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: Text(t.common.delete),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;
    await context.read<ProfileCubit>().deleteProfile(name);

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(t.profile.deleteSuccess)),
    );
  }

  Future<void> _newProfile(BuildContext context) async {
    final result = await showDialog<({String name, String version})>(
      context: context,
      builder: (_) => const SaveProfileDialog(),
    );
    if (result == null || !context.mounted) return;

    final profileCubit = context.read<ProfileCubit>();
    final configState = context.read<BuildConfigCubit>().state;
    final t = context.t;

    final existingNames = profileCubit.state.profiles.map((p) => p.name).toSet();

    if (existingNames.contains(result.name)) {
      if (!context.mounted) return;
      final overwrite = await showDialog<bool>(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(t.profile.newProfile),
          content: Text(t.profile.overwriteConfirm(name: result.name)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(t.common.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(t.profile.updateExisting),
            ),
          ],
        ),
      );
      if (overwrite != true || !context.mounted) return;

      await profileCubit.updateProfile(
        name: result.name,
        version: result.version,
        configState: configState,
      );
    } else {
      await profileCubit.saveProfile(
        name: result.name,
        version: result.version,
        configState: configState,
      );
    }

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(t.profile.saveSuccess(name: result.name))),
    );
  }
}
