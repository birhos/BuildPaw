import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../application/build_execution/build_execution_bloc.dart';
import '../../application/build_execution/build_execution_state.dart';
import '../../core/theme/app_colors.dart';

class BuildLogPanel extends StatefulWidget {
  const BuildLogPanel({super.key});

  @override
  State<BuildLogPanel> createState() => _BuildLogPanelState();
}

class _BuildLogPanelState extends State<BuildLogPanel> {
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
    return BlocConsumer<BuildExecutionBloc, BuildExecutionState>(
      listener: (context, state) {
        if (state is BuildRunning || state is BuildSuccess || state is BuildError) {
          _scrollToBottom();
        }
      },
      builder: (context, state) {
        final logs = switch (state) {
          BuildRunning s => s.logs,
          BuildSuccess s => s.logs,
          BuildError s => s.logs,
          _ => <LogEntry>[],
        };

        final isIdle = state is BuildIdle;

        return Card(
          color: AppColors.terminalBg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    const Icon(Icons.terminal,
                        size: 18, color: AppColors.onSurfaceVariant),
                    const SizedBox(width: 8),
                    Text(
                      'Build Output',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                    ),
                    const Spacer(),
                    _statusBadge(state),
                  ],
                ),
              ),
              const Divider(
                  height: 1, color: AppColors.outlineVariant),
              SizedBox(
                height: 300,
                child: isIdle && logs.isEmpty
                    ? Center(
                        child: Text(
                          'Build output will appear here...',
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 13,
                            color: AppColors.onSurfaceVariant
                                .withValues(alpha: 0.5),
                          ),
                        ),
                      )
                    : ListView.builder(
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
                              fontWeight: entry.isHeader
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          );
                        },
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

  Widget _statusBadge(BuildExecutionState state) {
    final (String label, Color color) = switch (state) {
      BuildIdle() => ('Idle', AppColors.onSurfaceVariant),
      BuildRunning() => ('Running', AppColors.warning),
      BuildSuccess() => ('Success', AppColors.success),
      BuildError() => ('Failed', AppColors.error),
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
