import 'package:equatable/equatable.dart';

import '../enums/build_mode.dart';
import '../enums/ios_output_type.dart';

class IosBuildConfig extends Equatable {
  const IosBuildConfig({
    this.outputType = IosOutputType.ipa,
    this.obfuscate = false,
    this.splitDebugInfo = false,
    this.flavor = '',
    this.buildMode = BuildMode.release,
    this.target = 'lib/main.dart',
  });

  factory IosBuildConfig.fromJson(Map<String, dynamic> json) {
    return IosBuildConfig(
      outputType: IosOutputType.values.byName(json['outputType'] as String? ?? IosOutputType.ipa.name),
      obfuscate: json['obfuscate'] as bool? ?? false,
      splitDebugInfo: json['splitDebugInfo'] as bool? ?? false,
      flavor: json['flavor'] as String? ?? '',
      buildMode: BuildMode.values.byName(json['buildMode'] as String? ?? BuildMode.release.name),
      target: json['target'] as String? ?? 'lib/main.dart',
    );
  }
  final IosOutputType outputType;
  final bool obfuscate;
  final bool splitDebugInfo;
  final String flavor;
  final BuildMode buildMode;
  final String target;

  IosBuildConfig copyWith({
    IosOutputType? outputType,
    bool? obfuscate,
    bool? splitDebugInfo,
    String? flavor,
    BuildMode? buildMode,
    String? target,
  }) {
    return IosBuildConfig(
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
