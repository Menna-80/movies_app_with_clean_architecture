
import 'package:movies_app/movies/domain/entities/videos.dart';

class VideosModel extends VideosEntity {
  const VideosModel(
      {required super.name,
      required super.key,
      required super.type,
      required super.iso_639_1,
      required super.iso_3166_1,
      required super.site,
      required super.size,
      required super.official,
      required super.published_at,
      required super.id});

  factory VideosModel.fromjson(Map<String, dynamic> json) => VideosModel(
        name: json['name'],
        type: json['type'],
        key: json['key'],
        iso_639_1: json['iso_639_1'],
        iso_3166_1: json['iso_3166_1'],
        size: json['size'],
        site: json['site'],
        official: json['official'],
        published_at: json['published_at'],
        id: json['id'],
      );
}
