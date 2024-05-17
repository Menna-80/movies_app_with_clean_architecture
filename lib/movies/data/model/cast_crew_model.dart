
import 'package:movies_app/movies/domain/entities/cast_crew.dart';

class CastModel extends CastCrew{
  const CastModel({
    required super.id,
    required super.name,
    required super.character,
    required super.profilePath
  });


  factory CastModel.fromjson(Map<String,dynamic>json)=>CastModel(
    id: json['cast_id'],
    name: json['name'],
    character: json['character'],
    profilePath: json['profile_path'],
  );

}