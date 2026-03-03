import 'package:equatable/equatable.dart';

import '../enums/android_output_type.dart';
import '../enums/build_mode.dart';

class AndroidBuildConfig extends Equatable {
  const AndroidBuildConfig({
    this.outputType = AndroidOutputType.apk,
    this.obfuscate = false,
    this.splitDebugInfo = false,
    this.noTreeShakeIcons = false,
    this.flavor = '',
    this.buildMode = BuildMode.release,
    this.target = 'lib/main.dart',
  });

  factory AndroidBuildConfig.fromJson(Map<String, dynamic> json) {
    return AndroidBuildConfig(
      outputType: AndroidOutputType.values.byName(json['outputType'] as String? ?? AndroidOutputType.apk.name),
      obfuscate: json['obfuscate'] as bool? ?? false,
      splitDebugInfo: json['splitDebugInfo'] as bool? ?? false,
      noTreeShakeIcons: json['noTreeShakeIcons'] as bool? ?? false,
      flavor: json['flavor'] as String? ?? '',
      buildMode: BuildMode.values.byName(json['buildMode'] as String? ?? BuildMode.release.name),
      target: json['target'] as String? ?? 'lib/main.dart',
    );
  }
  final AndroidOutputType outputType;
  final bool obfuscate;
  final bool splitDebugInfo;
  final bool noTreeShakeIcons;
  final String flavor;
  final BuildMode buildMode;
  final String target;

  AndroidBuildConfig copyWith({
    AndroidOutputType? outputType,
    bool? obfuscate,
    bool? splitDebugInfo,
    bool? noTreeShakeIcons,
    String? flavor,
    BuildMode? buildMode,
    String? target,
  }) {
    return AndroidBuildConfig(
      outputType: outputType ?? this.outputType,
      obfuscate: obfuscate ?? this.obfuscate,
      splitDebugInfo: splitDebugInfo ?? this.splitDebugInfo,
      noTreeShakeIcons: noTreeShakeIcons ?? this.noTreeShakeIcons,
      flavor: flavor ?? this.flavor,
      buildMode: buildMode ?? this.buildMode,
      target: target ?? this.target,
    );
  }

  Map<String, dynamic> toJson() => {
    'outputType': outputType.name,
    'obfuscate': obfuscate,
    'splitDebugInfo': splitDebugInfo,
    'noTreeShakeIcons': noTreeShakeIcons,
    'flavor': flavor,
    'buildMode': buildMode.name,
    'target': target,
  };

  @override
  List<Object?> get props => [
    outputType,
    obfuscate,
    splitDebugInfo,
    noTreeShakeIcons,
    flavor,
    buildMode,
    target,
  ];
}
