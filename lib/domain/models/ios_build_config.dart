import 'package:equatable/equatable.dart';

import '../enums/build_mode.dart';
import '../enums/ios_output_type.dart';

class IosBuildConfig extends Equatable {
  final IosOutputType outputType;
  final bool obfuscate;
  final bool splitDebugInfo;
  final String flavor;
  final BuildMode buildMode;
  final String target;

  const IosBuildConfig({
    this.outputType = IosOutputType.ipa,
    this.obfuscate = false,
    this.splitDebugInfo = false,
    this.flavor = '',
    this.buildMode = BuildMode.release,
    this.target = 'lib/main.dart',
  });

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
