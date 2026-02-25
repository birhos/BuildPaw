import 'package:equatable/equatable.dart';

import '../enums/android_output_type.dart';
import '../enums/build_mode.dart';

class AndroidBuildConfig extends Equatable {
  final AndroidOutputType outputType;
  final bool obfuscate;
  final bool splitDebugInfo;
  final String flavor;
  final BuildMode buildMode;
  final String target;

  const AndroidBuildConfig({
    this.outputType = AndroidOutputType.apk,
    this.obfuscate = false,
    this.splitDebugInfo = false,
    this.flavor = '',
    this.buildMode = BuildMode.release,
    this.target = 'lib/main.dart',
  });

  AndroidBuildConfig copyWith({
    AndroidOutputType? outputType,
    bool? obfuscate,
    bool? splitDebugInfo,
    String? flavor,
    BuildMode? buildMode,
    String? target,
  }) {
    return AndroidBuildConfig(
      outputType: outputType ?? this.outputType,
      obfuscate: obfuscate ?? this.obfuscate,
      splitDebugInfo: splitDebugInfo ?? this.splitDebugInfo,
      flavor: flavor ?? this.flavor,
      buildMode: buildMode ?? this.buildMode,
      target: target ?? this.target,
    );
  }

  Map<String, dynamic> toJson() => {
        'outputType': outputType.name,
        'obfuscate': obfuscate,
        'splitDebugInfo': splitDebugInfo,
        'flavor': flavor,
        'buildMode': buildMode.name,
        'target': target,
      };

  factory AndroidBuildConfig.fromJson(Map<String, dynamic> json) {
    return AndroidBuildConfig(
      outputType: AndroidOutputType.values.byName(
          json['outputType'] as String? ?? AndroidOutputType.apk.name),
      obfuscate: json['obfuscate'] as bool? ?? false,
      splitDebugInfo: json['splitDebugInfo'] as bool? ?? false,
      flavor: json['flavor'] as String? ?? '',
      buildMode: BuildMode.values
          .byName(json['buildMode'] as String? ?? BuildMode.release.name),
      target: json['target'] as String? ?? 'lib/main.dart',
    );
  }

  @override
  List<Object?> get props => [
        outputType,
        obfuscate,
        splitDebugInfo,
        flavor,
        buildMode,
        target,
      ];
}
