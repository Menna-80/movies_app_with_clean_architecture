import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/favorite_movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';


class AddFavoritesMovieUseCase extends BaseUseCase<int,FavoritesMovies>{
final BaseMoviesRepository baseMoviesRepository;
AddFavoritesMovieUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, int>> call(FavoritesMovies parameters) async {
   return await baseMoviesRepository.addFavoritesItem(parameters);
  }

}

