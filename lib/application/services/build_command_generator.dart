import 'package:buildpaw/core/constants/app_constants.dart';
import 'package:buildpaw/domain/enums/android_output_type.dart';
import 'package:buildpaw/domain/enums/build_mode.dart';
import 'package:buildpaw/domain/enums/pwa_strategy.dart';
import 'package:buildpaw/domain/models/android_build_config.dart';
import 'package:buildpaw/domain/models/ios_build_config.dart';
import 'package:buildpaw/domain/models/web_build_config.dart';

class BuildCommand {
  final String executable;
  final List<String> arguments;
  final String displayName;

  const BuildCommand({
    required this.executable,
    required this.arguments,
    required this.displayName,
  });

  String get fullCommand => '$executable ${arguments.join(' ')}';
}

class BuildCommandGenerator {
  /// Generates Android build commands. Returns 1 or 2 commands depending
  /// on output type (both = apk + aab).
  List<BuildCommand> generateAndroid({
    required AndroidBuildConfig config,
    required bool useFvm,
  }) {
    final commands = <BuildCommand>[];

    if (config.outputType == AndroidOutputType.both) {
      commands.add(_buildAndroidCommand(
        buildType: 'apk',
        config: config,
        useFvm: useFvm,
        displayName: 'Android APK',
      ));
      commands.add(_buildAndroidCommand(
        buildType: 'appbundle',
        config: config,
        useFvm: useFvm,
        displayName: 'Android AAB',
      ));
    } else {
      commands.add(_buildAndroidCommand(
        buildType: config.outputType.command,
        config: config,
        useFvm: useFvm,
        displayName:
            'Android ${config.outputType == AndroidOutputType.apk ? 'APK' : 'AAB'}',
      ));
    }

    return commands;
  }

  BuildCommand _buildAndroidCommand({
    required String buildType,
    required AndroidBuildConfig config,
    required bool useFvm,
    required String displayName,
  }) {
    final args = <String>[];
    if (useFvm) args.add('flutter');
    args.addAll(['build', buildType]);
    _addCommonFlags(
      args,
      buildMode: config.buildMode,
      obfuscate: config.obfuscate,
      splitDebugInfo: config.splitDebugInfo,
      flavor: config.flavor,
      target: config.target,
    );

    return BuildCommand(
      executable: useFvm ? 'fvm' : 'flutter',
      arguments: args,
      displayName: displayName,
    );
  }

  /// Generates the iOS build command.
  List<BuildCommand> generateIos({
    required IosBuildConfig config,
    required bool useFvm,
  }) {
    final args = <String>[];
    if (useFvm) args.add('flutter');
    args.addAll(['build', config.outputType.command]);
    _addCommonFlags(
      args,
      buildMode: config.buildMode,
      obfuscate: config.obfuscate,
      splitDebugInfo: config.splitDebugInfo,
      flavor: config.flavor,
      target: config.target,
    );

    return [
      BuildCommand(
        executable: useFvm ? 'fvm' : 'flutter',
        arguments: args,
        displayName: 'iOS ${config.outputType.label}',
      ),
    ];
  }

  /// Generates the Web build command.
  List<BuildCommand> generateWeb({
    required WebBuildConfig config,
    required bool useFvm,
  }) {
    final args = <String>[];
    if (useFvm) args.add('flutter');
    args.addAll(['build', 'web']);

    args.add(config.buildMode.flag);

    if (config.pwaStrategy != PwaStrategy.defaultStrategy) {
      args.add('--pwa-strategy=${config.pwaStrategy.value}');
    }

    if (config.noTreeShakeIcons) {
      args.add('--no-tree-shake-icons');
    }

    if (config.flavor.isNotEmpty) {
      args.addAll(['--flavor', config.flavor]);
    }

    if (config.target != AppConstants.defaultTarget &&
        config.target.isNotEmpty) {
      args.addAll(['--target', config.target]);
    }

    return [
      BuildCommand(
        executable: useFvm ? 'fvm' : 'flutter',
        arguments: args,
        displayName: 'Web',
      ),
    ];
  }

  void _addCommonFlags(
    List<String> args, {
    required BuildMode buildMode,
    required bool obfuscate,
    required bool splitDebugInfo,
    required String flavor,
    required String target,
  }) {
    args.add(buildMode.flag);

    if (obfuscate) {
      args.add('--obfuscate');
    }

    if (splitDebugInfo) {
      args.add('--split-debug-info=${AppConstants.splitDebugInfoPath}');
    }

    if (flavor.isNotEmpty) {
      args.addAll(['--flavor', flavor]);
    }

    if (target != AppConstants.defaultTarget && target.isNotEmpty) {
      args.addAll(['--target', target]);
    }
  }
}
