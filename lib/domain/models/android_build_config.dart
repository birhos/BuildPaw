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
