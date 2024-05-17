import 'package:equatable/equatable.dart';

class CastCrew extends Equatable{
  final int id;
  final String? profilePath;
  final String name;
  final String character;

  const CastCrew({
    required this.id,
    required this.name,
    required this.character,
    required this.profilePath,
  });

  @override
  List<Object?> get props => [id];

}