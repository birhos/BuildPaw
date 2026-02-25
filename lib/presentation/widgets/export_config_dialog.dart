import 'package:flutter/material.dart';

import '../../core/core.dart';

final class ExportConfigDialog extends StatefulWidget {
  const ExportConfigDialog({super.key});

  @override
  State<ExportConfigDialog> createState() => _ExportConfigDialogState();
}

final class _ExportConfigDialogState extends State<ExportConfigDialog> {
  final _nameController = TextEditingController(text: 'my-build-config');
  final _versionController = TextEditingController(text: '1.0.0');

  @override
  void dispose() {
    _nameController.dispose();
    _versionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return AlertDialog(
      title: Text(t.exportDialog.title),
      content: SizedBox(
        width: 360,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: t.exportDialog.presetName,
                hintText: t.exportDialog.presetNameHint,
              ),
              autofocus: true,
            ),

            //
            const SizedBox(height: 16),

            //
            TextField(
              controller: _versionController,
              decoration: InputDecoration(
                labelText: t.exportDialog.version,
                hintText: t.exportDialog.versionHint,
              ),
            ),
          ],
        ),
      ),
      actions: [
        //
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(t.common.cancel),
        ),

        //
        ElevatedButton(
          onPressed: () {
            final name = _nameController.text.trim();
            final version = _versionController.text.trim();
            if (name.isEmpty || version.isEmpty) return;
            Navigator.of(context).pop((name: name, version: version));
          },
          child: Text(t.common.export),
        ),
      ],
    );
  }
}
