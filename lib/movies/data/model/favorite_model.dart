
import 'package:movies_app/movies/domain/entities/favorite_movies.dart';

class FavoritesMoviesModel extends FavoritesMovies {
  const FavoritesMoviesModel(
      {required super.id,
      required super.title,
      required super.posterUrl,
      required super.voteAverage,
      required super.releaseDate,
      required super.overview
      });
    factory FavoritesMoviesModel.fromEntity(FavoritesMovies favoritesMovies) =>
      FavoritesMoviesModel(
          id: favoritesMovies.id,
          title: favoritesMovies.title,
          posterUrl: favoritesMovies.posterUrl,
          voteAverage: favoritesMovies.voteAverage,
          releaseDate: favoritesMovies.releaseDate,
          overview: favoritesMovies.overview
      );
}
