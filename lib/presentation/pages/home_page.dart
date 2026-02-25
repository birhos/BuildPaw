import 'package:flutter/material.dart';

import '../widgets/build_action_bar.dart';
import '../widgets/build_log_panel.dart';
import '../widgets/platform_config/android_config_panel.dart';
import '../widgets/platform_config/ios_config_panel.dart';
import '../widgets/platform_config/web_config_panel.dart';
import '../widgets/project_info_card.dart';
import '../widgets/project_selector_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            children: const [
              ProjectSelectorWidget(),
              SizedBox(height: 12),
              ProjectInfoCard(),
              SizedBox(height: 8),
              AndroidConfigPanel(),
              IosConfigPanel(),
              WebConfigPanel(),
              SizedBox(height: 4),
              BuildActionBar(),
              SizedBox(height: 4),
              BuildLogPanel(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
