import 'package:flutter/material.dart';

import '../../core/i18n/strings.g.dart';

class SaveProfileDialog extends StatefulWidget {
  const SaveProfileDialog({super.key, this.initialName, this.initialVersion});

  final String? initialName;
  final String? initialVersion;

  @override
  State<SaveProfileDialog> createState() => _SaveProfileDialogState();
}

class _SaveProfileDialogState extends State<SaveProfileDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _versionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
    _versionController =
        TextEditingController(text: widget.initialVersion ?? '1.0.0');
  }

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
      title: Text(t.profile.saveProfile),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: t.profile.profileName,
                hintText: t.profile.profileNameHint,
              ),
              autofocus: true,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? t.profile.profileName : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _versionController,
              decoration: InputDecoration(
                labelText: t.profile.version,
                hintText: t.profile.versionHint,
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? t.profile.version : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(t.common.cancel),
        ),
        FilledButton(
          onPressed: _submit,
          child: Text(t.common.save),
        ),
      ],
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    Navigator.pop(
      context,
      (
        name: _nameController.text.trim(),
        version: _versionController.text.trim(),
      ),
    );
  }
}
