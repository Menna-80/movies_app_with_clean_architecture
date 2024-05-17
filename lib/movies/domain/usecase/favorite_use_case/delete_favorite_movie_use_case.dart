import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';


class DeleteFavoritesMoviesUsecase extends BaseUseCase<Unit,int>{
 final BaseMoviesRepository baseMoviesRepository;
 DeleteFavoritesMoviesUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, Unit>> call(int parameters)async {
   return await baseMoviesRepository.removeFavoritesItem(parameters);
  }

}