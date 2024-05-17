import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/datasource/movie_local_data_source.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/model/favorite_model.dart';
import 'package:movies_app/movies/domain/entities/cast_crew.dart';
import 'package:movies_app/movies/domain/entities/favorite_movies.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_app/movies/domain/entities/videos.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_cast_crew_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_movie_detail_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_movie_recommendation_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_video_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_use_case/search_use_case.dart';


class MovieRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  final BaseFavoritesMovieLocalDataSource baseFavoritesMovieLocalDataSource;
  MovieRepository(
      this.baseMovieRemoteDataSource, this.baseFavoritesMovieLocalDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getUpComingMovies() async {
    final result = await baseMovieRemoteDataSource.getUpComingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendation>>> getMovieRecommendation(
      MovieRecommendationParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getMovieRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<CastCrew>>> getCastCrew(
      CastCrewParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getCastCrew(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<VideosEntity>>> getVideos(
      VideoParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getVideos(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getSearch(
      SearchParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getSearchMovies(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, int>> addFavoritesItem(
      FavoritesMovies favoritesMovies) async {
    try {
      int result = await baseFavoritesMovieLocalDataSource
          .addFavoritesItem(FavoritesMoviesModel.fromEntity(favoritesMovies));
      return Right(result);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, int>> checkIfItemAdded(int tmdbId)async {
    final result = await baseFavoritesMovieLocalDataSource.checkIfItemAdded(tmdbId);
    try {
      return Right(result);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<FavoritesMovies>>> getFavoritesItems() async{
    final result = await baseFavoritesMovieLocalDataSource.getFavoritemovie();
    try {
      return Right(result);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavoritesItem(int index)async {
    try{
      await baseFavoritesMovieLocalDataSource.removeFavoritesItem(index);
      return const  Right(unit);
    }on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }
}
