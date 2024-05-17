import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_local_data_source.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movie_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecase/favorite_use_case/add_favorite_movie_use_case.dart';
import 'package:movies_app/movies/domain/usecase/favorite_use_case/check_favorite_movie_use_case.dart';
import 'package:movies_app/movies/domain/usecase/favorite_use_case/delete_favorite_movie_use_case.dart';
import 'package:movies_app/movies/domain/usecase/favorite_use_case/get_favorite_movie_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_cast_crew_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_movie_detail_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_movie_recommendation_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_video_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_use_case/get_popular_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecase/movie_use_case/get_top_rated_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecase/movie_use_case/get_up_coming_usecase.dart';
import 'package:movies_app/movies/domain/usecase/movie_use_case/search_use_case.dart';
import 'package:movies_app/movies/presentation/controller/favorites/favorites_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movie_details/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/search/search_bloc.dart';


final getIt = GetIt.instance;

class ServicesLocator{
 void setup(){
   ///Bloc
   getIt.registerFactory(() => MovieBloc(getIt(),getIt(),getIt(),),);
   getIt.registerFactory(() => MovieDetailsBloc(getIt(),getIt(),getIt(),getIt()),);
   getIt.registerFactory(() => SearchBloc(getIt()),);
   getIt.registerFactory(() => FavoritesBloc(getIt(),getIt(),getIt(),getIt()),);

   ///use cases
   getIt.registerLazySingleton(() => GetNowPlayingMovieUsecase(getIt()));
   getIt.registerLazySingleton(() => GetPopularMoviesUsecase(getIt()));
   getIt.registerLazySingleton(() => GetTopRatedMoviesUsecase(getIt()));
   getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()));
   getIt.registerLazySingleton(() => GetMovieRecommendationUseCase(getIt()));
   getIt.registerLazySingleton(() => GetCastCrewUseCase(getIt()));
   getIt.registerLazySingleton(() => GetVideoUseCase(getIt()));
   getIt.registerLazySingleton(() => GetSearchUseCase(getIt()));
   getIt.registerLazySingleton(() => AddFavoritesMovieUseCase(getIt()));
   getIt.registerLazySingleton(() => CheckFavoritesMovieUseCase(getIt()));
   getIt.registerLazySingleton(() => DeleteFavoritesMoviesUsecase(getIt()));
   getIt.registerLazySingleton(() => GetFavoritesMoviesUsecase(getIt()));




   ///repository
   getIt.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(getIt(),getIt()));
   ///data source
   getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
   getIt.registerLazySingleton<BaseFavoritesMovieLocalDataSource>(() => FavoritesMovieLocalDataSource());
  }
}
