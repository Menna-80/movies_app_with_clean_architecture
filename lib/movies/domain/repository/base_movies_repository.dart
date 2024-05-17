import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/cast_crew.dart';
import 'package:movies_app/movies/domain/entities/favorite_movies.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_app/movies/domain/entities/videos.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_cast_crew_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_movie_detail_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_movie_recommendation_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_video_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_use_case/search_use_case.dart';


abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>> getUpComingMovies();

  Future<Either<Failure,List<Movie>>> getPopularMovies();

  Future<Either<Failure,List<Movie>>> getTopRatedMovies();

  Future<Either<Failure,MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);

  Future<Either<Failure,List<MovieRecommendation>>> getMovieRecommendation(MovieRecommendationParameters parameters);

  Future<Either<Failure,List<CastCrew>>> getCastCrew(CastCrewParameters parameters);

  Future<Either<Failure,List<VideosEntity>>> getVideos(VideoParameters parameters);

  Future<Either<Failure,List<Movie>>> getSearch(SearchParameters parameters);

  Future<Either<Failure, List<FavoritesMovies>>> getFavoritesItems();

  Future<Either<Failure, int>> addFavoritesItem(FavoritesMovies favoritesMovies);

  Future<Either<Failure, Unit>> removeFavoritesItem(int index);

  Future<Either<Failure, int>> checkIfItemAdded(int tmdbId);




}