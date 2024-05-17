import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/videos.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';


class GetVideoUseCase extends BaseUseCase<List<VideosEntity>,VideoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetVideoUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure,List<VideosEntity>>>call(VideoParameters parameters)async{
    return await baseMoviesRepository.getVideos(parameters);
  }
}
class VideoParameters extends Equatable{
  final movieId;

 const VideoParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];

}