import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/favorite_movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';


class GetFavoritesMoviesUsecase extends BaseUseCase<List<FavoritesMovies>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetFavoritesMoviesUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<FavoritesMovies>>> call(NoParameters parameters)async {

    return await baseMoviesRepository.getFavoritesItems();
  }


}