import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/netwark/error_massege_model.dart';
import 'package:movies_app/core/utils/constance.dart';
import 'package:movies_app/movies/data/model/cast_crew_model.dart';
import 'package:movies_app/movies/data/model/movie_detail_model.dart';
import 'package:movies_app/movies/data/model/movie_model.dart';
import 'package:movies_app/movies/data/model/recommendation_model.dart';
import 'package:movies_app/movies/data/model/videos_model.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_cast_crew_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_movie_detail_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_movie_recommendation_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_video_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_use_case/search_use_case.dart';



abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getUpComingMovies();
  Future<List<MovieModel>>getPopularMovies();
  Future<List<MovieModel>>getTopRatedMovies();
 Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getMovieRecommendation(MovieRecommendationParameters parameters);
  Future<List<CastModel>> getCastCrew(CastCrewParameters parameters);
  Future<List<VideosModel>> getVideos(VideoParameters parameters);
  Future<List<MovieModel>>getSearchMovies(SearchParameters parameters);

}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
 Future<List<MovieModel>> getUpComingMovies() async{
    final response= await Dio().get(ApiConstance.upComingPath);

    if(response.statusCode==200){

      return List<MovieModel>.from((response.data["results"]as List).map((e) => MovieModel.fromjson(e),
      ));
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies()async {
    final response= await Dio().get(ApiConstance.popularPath);

    if(response.statusCode==200) {
      return List<MovieModel>.from((response.data["results"] as List).map((e) =>
          MovieModel.fromjson(e),));
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));

    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response= await Dio().get(ApiConstance.topRatedPath);

    if(response.statusCode==200) {
      return List<MovieModel>.from((response.data["results"] as List).map((e) =>
          MovieModel.fromjson(e),));
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));

    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async {
    final response = await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200){
      return MovieDetailsModel.fromjson(response.data);
    }else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }

  }

  @override
  Future<List<RecommendationModel>> getMovieRecommendation(MovieRecommendationParameters parameters)async {
    final response = await Dio().get(ApiConstance.movieRecommendationPath(parameters.movieId));

    if(response.statusCode == 200){
      return List<RecommendationModel>.from((response.data["results"]as List).map((e) => RecommendationModel.fromjson(e),));
    }else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }


   
  }

  @override
  Future<List<CastModel>> getCastCrew(CastCrewParameters parameters)async {
   final response= await Dio().get(ApiConstance.castCrewPath(parameters.movieId));
   if(response.statusCode ==200){
     return List<CastModel>.from((response.data["cast"]as List).map((e) => CastModel.fromjson(e),));

   }else {
     throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));
   }
  }

  @override
  Future<List<VideosModel>> getVideos(VideoParameters parameters)async {
   final response=await Dio().get(ApiConstance.VideoPath(parameters.movieId));
   if(response.statusCode ==200){
     return List<VideosModel>.from((response.data["results"]as List).map((e) => VideosModel.fromjson(e),));
   }else {
     throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));
   }
  }

  @override
  Future<List<MovieModel>> getSearchMovies(SearchParameters parameters)async {
    final response= await Dio().get(ApiConstance.SearchPath(parameters.movieName));
    if(response.statusCode ==200){
      return List<MovieModel>.from((response.data["results"]as List).map((e) => MovieModel.fromjson(e),));


    }else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  
}