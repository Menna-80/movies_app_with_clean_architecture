import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

part 'favorite_movies.g.dart';
@HiveType(typeId: 0)
class FavoritesMovies extends Equatable{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String posterUrl;
  @HiveField(3)
  final double voteAverage;
  @HiveField(4)
  final String releaseDate;
  @HiveField(5)
  final String overview;


 const FavoritesMovies(
     {required this.id,required this.title,required this.posterUrl, required this.voteAverage,
       required this.releaseDate,required this.overview,});


  factory FavoritesMovies.fromMovieDetails(MovieDetails movieDetails){
    return FavoritesMovies(
      id: movieDetails.id,
      title: movieDetails.title,
      posterUrl: movieDetails.backdropPath,
      voteAverage: movieDetails.voteAverage,
      releaseDate: movieDetails.releaseDate,
      overview: movieDetails.overView,
    );
  }

  @override

  List<Object?> get props => [id,title,posterUrl,voteAverage,releaseDate,overview];



}