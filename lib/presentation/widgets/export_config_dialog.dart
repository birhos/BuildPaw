import 'package:flutter/material.dart';

class ExportConfigDialog extends StatefulWidget {
  const ExportConfigDialog({super.key});

  @override
  State<ExportConfigDialog> createState() => _ExportConfigDialogState();
}

class _ExportConfigDialogState extends State<ExportConfigDialog> {
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
    return AlertDialog(
      title: const Text('Export Build Config'),
      content: SizedBox(
        width: 360,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Preset Name',
                hintText: 'e.g. release-prod',
              ),
              autofocus: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _versionController,
              decoration: const InputDecoration(
                labelText: 'Version',
                hintText: 'e.g. 1.0.0',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final name = _nameController.text.trim();
            final version = _versionController.text.trim();
            if (name.isEmpty || version.isEmpty) return;
            Navigator.of(context)
                .pop((name: name, version: version));
          },
          child: const Text('Export'),
        ),
      ],
    );
  }
}
