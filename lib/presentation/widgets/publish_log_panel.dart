import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../application/application.dart';
import '../../core/core.dart';

final class PublishLogPanel extends StatelessWidget {
  const PublishLogPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocBuilder<PublishCubit, PublishState>(
      builder: (context, state) {
        final logs = switch (state) {
          final PublishRunning s => s.logs,
          final PublishSuccess s => s.logs,
          final PublishError s => s.logs,
          _ => <PublishLogEntry>[],
        };

        final isIdle = state is PublishIdle || state is PublishCheckingFastlane;

        return Card(
          color: AppColors.terminalBg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    const Icon(Icons.terminal, size: 18, color: AppColors.onSurfaceVariant),
                    const SizedBox(width: 8),
                    Text(
                      t.publish.publishLogTitle,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
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
                            SnackBar(
                              content: Text(t.buildLog.copied),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    const SizedBox(width: 4),
                    _statusBadge(context, state),
                  ],
                ),
              ),
              const Divider(height: 1, color: AppColors.outlineVariant),
              Directionality(
                textDirection: TextDirection.ltr,
                child: SizedBox(
                  height: 200,
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
                                  fontWeight:
                                      entry.isHeader ? FontWeight.bold : FontWeight.normal,
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

  Color _logColor(PublishLogEntry entry) {
    if (entry.isHeader) return AppColors.primary;
    if (entry.isError) return AppColors.terminalError;
    if (entry.text.startsWith('✓')) return AppColors.terminalSuccess;
    return AppColors.terminalText;
  }

  Widget _statusBadge(BuildContext context, PublishState state) {
    final t = context.t;
    final (String label, Color color) = switch (state) {
      PublishIdle() => (t.buildStatus.idle, AppColors.onSurfaceVariant),
      PublishCheckingFastlane() => (t.buildStatus.running, AppColors.warning),
      PublishRunning() => (t.buildStatus.running, AppColors.warning),
      PublishSuccess() => (t.buildStatus.success, AppColors.success),
      PublishError() => (t.buildStatus.failed, AppColors.error),
      PublishFastlaneMissing() => ('Fastlane?', AppColors.warning),
      PublishConfigMissing() => ('Config?', AppColors.warning),
      PublishReady() => (t.buildStatus.idle, AppColors.onSurfaceVariant),
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
