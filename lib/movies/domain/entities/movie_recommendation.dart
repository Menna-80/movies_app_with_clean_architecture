import 'package:equatable/equatable.dart';

class MovieRecommendation extends Equatable{
  final int id;
  final String? backdropPath;
  final String title;

 const MovieRecommendation({required this.id, this.backdropPath,required this.title});

  @override

  List<Object?> get props => [id, backdropPath];
}