import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_cast_crew_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_movie_detail_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_movie_recommendation_use_case.dart';
import 'package:movies_app/movies/domain/usecase/movie_details_use_case/get_video_use_case.dart';
import 'package:movies_app/movies/presentation/controller/movie_details/movie_details_state.dart';


part 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationUseCase getMovieRecommendationsUsecase;
  final GetCastCrewUseCase getCastCrewUseCase;
  final GetVideoUseCase getVideoUseCase;

  MovieDetailsBloc(
      this.getMovieDetailsUseCase,
      this.getMovieRecommendationsUsecase,
      this.getCastCrewUseCase,
      this.getVideoUseCase
      ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getRecommendations);
    on<GetMovieCastEvent>(_getCastCrew);
    on<GetMovieVideoEvent>(_getVideos);
  }


  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            movieDetailsState: RequestState.loaded, movieDetails: r)));
  }

  FutureOr<void> _getRecommendations(GetMovieRecommendationsEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getMovieRecommendationsUsecase(
        MovieRecommendationParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieRecommendationState: RequestState.error,
            movieRecommendationMessage: l.message)),
        (r) => emit(state.copyWith(
            movieRecommendationState: RequestState.loaded,
            movieRecommendations: r)));
  }

  FutureOr<void> _getCastCrew(
      GetMovieCastEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getCastCrewUseCase(CastCrewParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieCastState: RequestState.error, movieCastMessage: l.message)),
        (r) => emit(
            state.copyWith(movieCastState: RequestState.loaded, movieCast: r)));
  }

  FutureOr<void> _getVideos(
      GetMovieVideoEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getVideoUseCase(VideoParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieVideoState: RequestState.error, movieVideoMessage: l.message)),
        (r) => emit(state.copyWith(
            movieVideoState: RequestState.loaded, movieVideo: r)));
  }
}
