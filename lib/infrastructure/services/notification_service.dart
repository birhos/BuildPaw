import 'dart:io';

import '../../core/i18n/strings.g.dart';

/// Shows macOS system notifications for publish results.
/// Uses BuildPawNotifier.app (stay-open AppleScript app) for custom icon.
/// See: https://stackoverflow.com/q/48856158
final class NotificationService {
  String? _notifierPath;

  String? get _buildPawNotifierPath {
    if (_notifierPath != null) return _notifierPath;
    // Platform.resolvedExecutable = .../BuildPaw.app/Contents/MacOS/buildpaw
    final exe = Platform.resolvedExecutable;
    final contentsDir = File(exe).parent.parent;
    final notifierApp = File(
      '${contentsDir.path}/Resources/BuildPawNotifier.app',
    );
    if (notifierApp.existsSync()) {
      _notifierPath = notifierApp.path;
    }
    return _notifierPath;
  }

  Future<void> _ensureNotifierRunning() async {
    final path = _buildPawNotifierPath;
    if (path == null) return;
    try {
      await Process.run('open', [path]);
      await Future<void>.delayed(const Duration(milliseconds: 500));
    } catch (_) {
      // Ignore
    }
  }

  Future<void> showPublishSuccess({
    required String platform,
    String? track,
  }) async {
    if (!Platform.isMacOS) return;

    final locale = LocaleSettings.currentLocale;
    final t = await locale.build();
    final subtitle = track != null
        ? t.publish.notificationSuccessSubtitle(platform: platform, track: track)
        : t.publish.notificationSuccessSubtitlePlatform(platform: platform);

    await _showNotification(
      title: t.publish.notificationSuccessTitle,
      subtitle: subtitle,
      body: t.publish.notificationSuccessBody,
      soundName: 'Glass',
    );
  }

  Future<void> showPublishError() async {
    if (!Platform.isMacOS) return;

    final locale = LocaleSettings.currentLocale;
    final t = await locale.build();

    await _showNotification(
      title: t.publish.notificationErrorTitle,
      subtitle: t.publish.notificationErrorSubtitle,
      body: t.publish.notificationErrorBody,
      soundName: 'Basso',
    );
  }

  Future<void> _showNotification({
    required String title,
    required String body,
    String? subtitle,
    String? soundName,
  }) async {
    try {
      final path = _buildPawNotifierPath;
      if (path != null) {
        await _ensureNotifierRunning();
        final t = _escapeForOsascript(title);
        final s = _escapeForOsascript(subtitle ?? '');
        final b = _escapeForOsascript(body);
        final sound = soundName != null && soundName.isNotEmpty ? _escapeForOsascript(soundName) : '';
        final script = 'tell application "BuildPawNotifier" to notify("$t", "$s", "$b", "$sound")';
        await Process.run('osascript', ['-e', script]);
      } else {
        await _showNotificationFallback(
          title: title,
          body: body,
          subtitle: subtitle,
          soundName: soundName,
        );
      }
    } catch (_) {
      await _showNotificationFallback(
        title: title,
        body: body,
        subtitle: subtitle,
        soundName: soundName,
      );
    }
  }

  Future<void> _showNotificationFallback({
    required String title,
    required String body,
    String? subtitle,
    String? soundName,
  }) async {
    try {
      final escapedTitle = _escapeForOsascript(title);
      final escapedBody = _escapeForOsascript(body);
      var script = 'display notification "$escapedBody" with title "$escapedTitle"';
      if (subtitle != null && subtitle.isNotEmpty) {
        final escapedSubtitle = _escapeForOsascript(subtitle);
        script += ' subtitle "$escapedSubtitle"';
      }
      if (soundName != null && soundName.isNotEmpty) {
        script += ' sound name "$soundName"';
      }
      await Process.run('osascript', ['-e', script]);
    } catch (_) {
      // Ignore notification failures
    }
  }

  String _escapeForOsascript(String s) => s.replaceAll(r'\', r'\\').replaceAll('"', r'\"').replaceAll('\n', ' ');
}
