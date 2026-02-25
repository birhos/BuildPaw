import 'package:equatable/equatable.dart';

class ProjectInfo extends Equatable {
  final String name;
  final String path;
  final String version;
  final String branch;
  final String? latestTag;
  final String flutterVersion;
  final String dartVersion;
  final bool hasFvm;

  const ProjectInfo({
    required this.name,
    required this.path,
    required this.version,
    required this.branch,
    this.latestTag,
    required this.flutterVersion,
    required this.dartVersion,
    required this.hasFvm,
  });

  @override
  List<Object?> get props => [
        name,
        path,
        version,
        branch,
        latestTag,
        flutterVersion,
        dartVersion,
        hasFvm,
      ];
}
