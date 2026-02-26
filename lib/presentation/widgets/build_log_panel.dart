import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../application/application.dart';
import '../../core/core.dart';

final class BuildLogPanel extends StatefulWidget {
  const BuildLogPanel({super.key});

  @override
  State<BuildLogPanel> createState() => _BuildLogPanelState();
}

final class _BuildLogPanelState extends State<BuildLogPanel> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocConsumer<BuildExecutionBloc, BuildExecutionState>(
      listener: (context, state) {
        if (state is BuildRunning || state is BuildSuccess || state is BuildError) {
          _scrollToBottom();
        }
      },
      builder: (context, state) {
        final logs = switch (state) {
          final BuildRunning s => s.logs,
          final BuildSuccess s => s.logs,
          final BuildError s => s.logs,
          _ => <LogEntry>[],
        };

        final isIdle = state is BuildIdle;

        return Card(
          color: AppColors.terminalBg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    const Icon(Icons.terminal, size: 18, color: AppColors.onSurfaceVariant),
                    const SizedBox(width: 8),
                    Text(
                      t.buildLog.title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.onSurfaceVariant),
                    ),
                    const Spacer(),
                    if (logs.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.copy, size: 16),
                        color: AppColors.onSurfaceVariant,
                        tooltip: t.buildLog.copyTooltip,
                        splashRadius: 16,
                        onPressed: () {
                          final text = logs.map((e) => '${e.text}\n').join();
                          Clipboard.setData(ClipboardData(text: text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(t.buildLog.copied), duration: const Duration(seconds: 2)),
                          );
                        },
                      ),
                    const SizedBox(width: 4),
                    _statusBadge(context, state),
                  ],
                ),
              ),

              //
              const Divider(height: 1, color: AppColors.outlineVariant),

              //
              Directionality(
                textDirection: TextDirection.ltr,
                child: SizedBox(
                  height: 300,
                  child: isIdle && logs.isEmpty
                      ? Center(
                          child: Text(
                            t.buildLog.placeholder,
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 13,
                              color: AppColors.onSurfaceVariant.withValues(alpha: 0.5),
                            ),
                          ),
                        )
                      : SelectableRegion(
                          selectionControls: MaterialTextSelectionControls(),
                          child: ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.all(12),
                            itemCount: logs.length,
                            itemBuilder: (context, index) {
                              final entry = logs[index];
                              return Text(
                                entry.text,
                                style: GoogleFonts.jetBrainsMono(
                                  fontSize: 12,
                                  height: 1.5,
                                  color: _logColor(entry),
                                  fontWeight: entry.isHeader ? FontWeight.bold : FontWeight.normal,
                                ),
                              );
                            },
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color _logColor(LogEntry entry) {
    if (entry.isHeader) return AppColors.primary;
    if (entry.isError) return AppColors.terminalError;
    if (entry.text.startsWith('✓')) return AppColors.terminalSuccess;
    return AppColors.terminalText;
  }

  Widget _statusBadge(BuildContext context, BuildExecutionState state) {
    final t = context.t;
    final (String label, Color color) = switch (state) {
      BuildIdle() => (t.buildStatus.idle, AppColors.onSurfaceVariant),
      BuildRunning() => (t.buildStatus.running, AppColors.warning),
      BuildSuccess() => (t.buildStatus.success, AppColors.success),
      BuildError() => (t.buildStatus.failed, AppColors.error),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}
