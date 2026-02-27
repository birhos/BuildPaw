import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';
import '../../core/core.dart';
import '../../domain/domain.dart';

class PublishConfigPage extends StatefulWidget {
  const PublishConfigPage({super.key});

  @override
  State<PublishConfigPage> createState() => _PublishConfigPageState();
}

class _PublishConfigPageState extends State<PublishConfigPage> {
  final _nameController = TextEditingController();
  final _firebaseAppIdController = TextEditingController();
  final _firebaseTokenController = TextEditingController();
  final _playPackageNameController = TextEditingController();
  final _playServiceAccountPathController = TextEditingController();
  final _ascBundleIdController = TextEditingController();
  final _ascAppleIdController = TextEditingController();
  final _ascTeamIdController = TextEditingController();
  final _ascItcTeamIdController = TextEditingController();
  final _ascApplePasswordController = TextEditingController();
  final _ascApiKeyIdController = TextEditingController();
  final _ascIssuerIdController = TextEditingController();
  final _ascApiKeyPathController = TextEditingController();

  PlayTrack _playTrack = PlayTrack.internal;
  PublishProfile? _editingProfile;

  @override
  void initState() {
    super.initState();
    final profile = context.read<PublishProfileCubit>().state.selectedProfile;
    if (profile != null) {
      _editingProfile = profile;
      _nameController.text = profile.name;
      _firebaseAppIdController.text = profile.firebaseAppId ?? '';
      _playPackageNameController.text = profile.playPackageName ?? '';
      _ascAppleIdController.text = profile.ascAppleId ?? '';
      _ascTeamIdController.text = profile.ascTeamId ?? '';
      _ascItcTeamIdController.text = profile.ascItcTeamId ?? '';
      _playServiceAccountPathController.text = profile.playServiceAccountJsonPath ?? '';
      _playTrack = profile.playTrack;
      _ascBundleIdController.text = profile.ascBundleId ?? '';
      _ascApiKeyIdController.text = profile.ascApiKeyId ?? '';
      _ascIssuerIdController.text = profile.ascIssuerId ?? '';
      _ascApiKeyPathController.text = profile.ascApiKeyPath ?? '';
    } else {
      _nameController.text = 'New Profile';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _firebaseAppIdController.dispose();
    _firebaseTokenController.dispose();
    _playPackageNameController.dispose();
    _playServiceAccountPathController.dispose();
    _ascBundleIdController.dispose();
    _ascAppleIdController.dispose();
    _ascTeamIdController.dispose();
    _ascItcTeamIdController.dispose();
    _ascApplePasswordController.dispose();
    _ascApiKeyIdController.dispose();
    _ascIssuerIdController.dispose();
    _ascApiKeyPathController.dispose();
    _ascTeamIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.publish.configureProfile),
        actions: [
          TextButton(
            onPressed: () => _save(context),
            child: Text(t.common.save),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: t.profile.profileName,
              hintText: t.profile.profileNameHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Firebase',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _firebaseAppIdController,
            decoration: InputDecoration(
              labelText: t.publish.firebaseAppId,
              hintText: t.publish.firebaseAppIdHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _firebaseTokenController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: t.publish.firebaseToken,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Google Play',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _playPackageNameController,
            decoration: InputDecoration(
              labelText: t.publish.playPackageName,
              hintText: t.publish.playPackageNameHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _playServiceAccountPathController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: t.publish.playServiceAccount,
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.folder_open),
                onPressed: () => _pickFile(
                  (path) => _playServiceAccountPathController.text = path,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<PlayTrack>(
            initialValue: _playTrack,
            decoration: const InputDecoration(
              labelText: 'Default track',
              border: OutlineInputBorder(),
            ),
            items: PlayTrack.values
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(_playTrackLabel(context, e)),
                  ),
                )
                .toList(),
            onChanged: (v) {
              if (v != null) setState(() => _playTrack = v);
            },
          ),
          const SizedBox(height: 24),
          Text(
            'App Store Connect',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _ascBundleIdController,
            decoration: InputDecoration(
              labelText: t.publish.ascBundleId,
              hintText: t.publish.ascBundleIdHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            t.publish.ascAppleIdAuth,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _ascAppleIdController,
            decoration: InputDecoration(
              labelText: t.publish.ascAppleId,
              hintText: t.publish.ascAppleIdHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _ascApplePasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: t.publish.ascApplePassword,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _ascTeamIdController,
            decoration: InputDecoration(
              labelText: t.publish.ascTeamId,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _ascItcTeamIdController,
            decoration: InputDecoration(
              labelText: t.publish.ascItcTeamId,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            t.publish.ascApiKeyAuth,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _ascApiKeyIdController,
            decoration: InputDecoration(
              labelText: t.publish.ascApiKeyId,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _ascIssuerIdController,
            decoration: InputDecoration(
              labelText: t.publish.ascIssuerId,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _ascApiKeyPathController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: t.publish.ascApiKeyPath,
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.folder_open),
                onPressed: () => _pickFile(
                  (path) => _ascApiKeyPathController.text = path,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _pickFile(void Function(String) onPicked) async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty && result.files.single.path != null) {
      onPicked(result.files.single.path!);
    }
  }

  Future<void> _save(BuildContext context) async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile name is required')),
      );
      return;
    }

    final id = _editingProfile?.id ?? DateTime.now().millisecondsSinceEpoch.toString();
    final cubit = context.read<PublishProfileCubit>();
    final profile = PublishProfile(
      id: id,
      name: name,
      createdAt: _editingProfile?.createdAt ?? DateTime.now(),
      firebaseAppId: _firebaseAppIdController.text.trim().isEmpty ? null : _firebaseAppIdController.text.trim(),
      playPackageName: _playPackageNameController.text.trim().isEmpty ? null : _playPackageNameController.text.trim(),
      playServiceAccountJsonPath: _playServiceAccountPathController.text.trim().isEmpty
          ? null
          : _playServiceAccountPathController.text.trim(),
      playTrack: _playTrack,
      ascBundleId: _ascBundleIdController.text.trim().isEmpty ? null : _ascBundleIdController.text.trim(),
      ascAppleId: _ascAppleIdController.text.trim().isEmpty ? null : _ascAppleIdController.text.trim(),
      ascTeamId: _ascTeamIdController.text.trim().isEmpty ? null : _ascTeamIdController.text.trim(),
      ascItcTeamId: _ascItcTeamIdController.text.trim().isEmpty ? null : _ascItcTeamIdController.text.trim(),
      ascApiKeyId: _ascApiKeyIdController.text.trim().isEmpty ? null : _ascApiKeyIdController.text.trim(),
      ascIssuerId: _ascIssuerIdController.text.trim().isEmpty ? null : _ascIssuerIdController.text.trim(),
      ascApiKeyPath: _ascApiKeyPathController.text.trim().isEmpty ? null : _ascApiKeyPathController.text.trim(),
    );

    await cubit.saveProfile(profile);

    final firebaseToken = _firebaseTokenController.text.trim();
    if (firebaseToken.isNotEmpty) {
      await cubit.saveSecureValue(id, 'firebase_token', firebaseToken);
    }
    final applePassword = _ascApplePasswordController.text.trim();
    if (applePassword.isNotEmpty) {
      await cubit.saveSecureValue(
        id,
        'fastlane_apple_application_specific_password',
        applePassword,
      );
    }
    context.read<PublishProfileCubit>().selectProfile(profile.id);
    if (context.mounted) {
      Navigator.pop(context, name);
    }
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
