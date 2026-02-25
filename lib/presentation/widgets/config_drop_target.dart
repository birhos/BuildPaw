import 'package:cross_file/cross_file.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../core/core.dart';

final class ConfigDropTarget extends StatefulWidget {
  const ConfigDropTarget({required this.child, super.key});
  final Widget child;

  @override
  State<ConfigDropTarget> createState() => _ConfigDropTargetState();
}

final class _ConfigDropTargetState extends State<ConfigDropTarget> {
  bool _dragging = false;

  bool _isJsonFile(XFile file) {
    final name = file.name;
    return name.toLowerCase().endsWith('.json');
  }

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: (detail) async {
        final jsonFiles = detail.files.where(_isJsonFile).toList();
        if (jsonFiles.isEmpty) return;

        final presetName = await context.read<BuildConfigCubit>().importConfigFromXFile(jsonFiles.first);

        if (!context.mounted) return;
        final t = context.t;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              presetName != null ? t.config.importSuccess(name: presetName) : t.config.importCancelled,
            ),
          ),
        );
      },
      onDragEntered: (_) => setState(() => _dragging = true),
      onDragExited: (_) => setState(() => _dragging = false),
      child: Material(
        child: Stack(
          children: [
            widget.child,
            if (_dragging)
              Positioned.fill(
                child: IgnorePointer(
                  child: ColoredBox(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerHigh,
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          border: Border.all(
                            color: AppColors.primary,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // ignore: prefer_const_constructors
                            Icon(
                              Icons.file_download,
                              color: AppColors.primary,
                              size: 32,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              context.t.config.dropToImport,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
