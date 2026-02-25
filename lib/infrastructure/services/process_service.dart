import 'dart:async';
import 'dart:convert';
import 'dart:io';

class ProcessResult {
  const ProcessResult({required this.exitCode, required this.logs});
  final int exitCode;
  final List<String> logs;

  bool get success => exitCode == 0;
}

class ProcessService {
  Process? _currentProcess;

  bool get isRunning => _currentProcess != null;

  /// Runs a command and streams output line-by-line.
  /// [onOutput] receives each line (both stdout and stderr).
  /// Returns a [ProcessResult] when complete.
  Future<ProcessResult> run({
    required String executable,
    required List<String> arguments,
    required String workingDirectory,
    required void Function(String line, bool isError) onOutput,
  }) async {
    final logs = <String>[];

    _currentProcess = await Process.start(
      executable,
      arguments,
      workingDirectory: workingDirectory,
      environment: _buildEnvironment(),
      runInShell: true,
    );

    final stdoutCompleter = Completer<void>();
    final stderrCompleter = Completer<void>();

    _currentProcess!.stdout.transform(utf8.decoder).transform(const LineSplitter()).listen(
      (line) {
        logs.add(line);
        onOutput(line, false);
      },
      onDone: stdoutCompleter.complete,
    );

    _currentProcess!.stderr.transform(utf8.decoder).transform(const LineSplitter()).listen(
      (line) {
        logs.add(line);
        onOutput(line, true);
      },
      onDone: stderrCompleter.complete,
    );

    final exitCode = await _currentProcess!.exitCode;
    await Future.wait([stdoutCompleter.future, stderrCompleter.future]);
    _currentProcess = null;

    return ProcessResult(exitCode: exitCode, logs: logs);
  }

  /// Runs a command and returns the combined stdout as a string.
  Future<String> runAndCapture({
    required String executable,
    required List<String> arguments,
    String? workingDirectory,
  }) async {
    final result = await Process.run(
      executable,
      arguments,
      workingDirectory: workingDirectory,
      environment: _buildEnvironment(),
      runInShell: true,
    );
    return (result.stdout as String).trim();
  }

  void cancel() {
    _currentProcess?.kill();
    _currentProcess = null;
  }

  Map<String, String> _buildEnvironment() {
    final env = Map<String, String>.from(Platform.environment);
    final paths = <String>[
      '/usr/local/bin',
      '/opt/homebrew/bin',
      '${Platform.environment['HOME']}/.pub-cache/bin',
      '${Platform.environment['HOME']}/fvm/default/bin',
    ];
    final existingPath = env['PATH'] ?? '';
    env['PATH'] = '${paths.join(':')}:$existingPath';
    return env;
  }
}
