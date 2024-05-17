import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/cast_crew.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';


class GetCastCrewUseCase extends BaseUseCase<List<CastCrew>,CastCrewParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetCastCrewUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<CastCrew>>> call(CastCrewParameters parameters)async {
    return await baseMoviesRepository.getCastCrew(parameters);
  }



}
class CastCrewParameters extends Equatable{
  final int movieId;
  const CastCrewParameters({required this.movieId});

  @override
  List<Object?> get props =>[movieId];

}