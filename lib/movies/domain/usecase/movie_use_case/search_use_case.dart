import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';



class GetSearchUseCase extends BaseUseCase<List<Movie>, SearchParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetSearchUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(SearchParameters parameters) async {
    return await baseMoviesRepository.getSearch(parameters);
  }
}

class SearchParameters extends Equatable {
  final String movieName;
  const SearchParameters({required this.movieName});

  @override
  List<Object?> get props => [movieName];
}
