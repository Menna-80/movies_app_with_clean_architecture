import 'package:equatable/equatable.dart';

class VideosEntity extends Equatable {
  final String name;
  final String key;
  final String type;
  final String iso_639_1;
  final String iso_3166_1;
  final String site;
  final int size;
  final bool official;
  final String published_at;
  final String id;

  const VideosEntity({
    required this.name,
    required this.key,
    required this.type,
    required this.iso_639_1,
    required this.iso_3166_1,
    required this.site,
    required this.size,
    required this.official,
    required this.published_at,
    required this.id,
  });

  @override
  List<Object?> get props => [key, type, name,id];
}
