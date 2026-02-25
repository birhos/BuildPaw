import 'package:equatable/equatable.dart';

import '../enums/build_mode.dart';
import '../enums/pwa_strategy.dart';
import '../enums/web_renderer.dart';

class WebBuildConfig extends Equatable {
  final PwaStrategy pwaStrategy;
  final WebRenderer webRenderer;
  final bool noTreeShakeIcons;
  final String flavor;
  final BuildMode buildMode;
  final String target;

  const WebBuildConfig({
    this.pwaStrategy = PwaStrategy.defaultStrategy,
    this.webRenderer = WebRenderer.auto,
    this.noTreeShakeIcons = true,
    this.flavor = '',
    this.buildMode = BuildMode.release,
    this.target = 'lib/main.dart',
  });

  WebBuildConfig copyWith({
    PwaStrategy? pwaStrategy,
    WebRenderer? webRenderer,
    bool? noTreeShakeIcons,
    String? flavor,
    BuildMode? buildMode,
    String? target,
  }) {
    return WebBuildConfig(
      pwaStrategy: pwaStrategy ?? this.pwaStrategy,
      webRenderer: webRenderer ?? this.webRenderer,
      noTreeShakeIcons: noTreeShakeIcons ?? this.noTreeShakeIcons,
      flavor: flavor ?? this.flavor,
      buildMode: buildMode ?? this.buildMode,
      target: target ?? this.target,
    );
  }

  @override
  List<Object?> get props => [
        pwaStrategy,
        webRenderer,
        noTreeShakeIcons,
        flavor,
        buildMode,
        target,
      ];
}
