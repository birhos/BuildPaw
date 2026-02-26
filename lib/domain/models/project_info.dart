import 'package:equatable/equatable.dart';

class ProjectInfo extends Equatable {
  const ProjectInfo({
    required this.name,
    required this.path,
    required this.version,
    required this.branch,
    required this.flutterVersion,
    required this.dartVersion,
    required this.hasFvm,
    this.latestTag,
    this.dependencies = const {},
  });
  final String name;
  final String path;
  final String version;
  final String branch;
  final String? latestTag;
  final String flutterVersion;
  final String dartVersion;
  final bool hasFvm;
  final Map<String, String> dependencies;

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
    dependencies,
  ];
}
