import 'package:equatable/equatable.dart';

class ProjectInfo extends Equatable {
  final String name;
  final String path;
  final String branch;
  final String flutterVersion;
  final String dartVersion;
  final bool hasFvm;

  const ProjectInfo({
    required this.name,
    required this.path,
    required this.branch,
    required this.flutterVersion,
    required this.dartVersion,
    required this.hasFvm,
  });

  @override
  List<Object?> get props => [
        name,
        path,
        branch,
        flutterVersion,
        dartVersion,
        hasFvm,
      ];
}
