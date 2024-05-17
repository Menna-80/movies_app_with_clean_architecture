import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';


class CheckFavoritesMovieUseCase extends BaseUseCase<int,int>{
final BaseMoviesRepository baseMoviesRepository;
CheckFavoritesMovieUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, int>> call(int parameters)async {
   return await baseMoviesRepository.checkIfItemAdded(parameters);
  }

}