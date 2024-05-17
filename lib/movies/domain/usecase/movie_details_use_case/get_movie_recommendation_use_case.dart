import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';


class GetMovieRecommendationUseCase extends BaseUseCase<List<MovieRecommendation>,MovieRecommendationParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieRecommendation>>> call(MovieRecommendationParameters parameters)async {
    return await baseMoviesRepository.getMovieRecommendation(parameters);
  }



}
class MovieRecommendationParameters extends Equatable{
  final int movieId;
 const MovieRecommendationParameters({required this.movieId});

  @override
  List<Object?> get props =>[movieId];

}