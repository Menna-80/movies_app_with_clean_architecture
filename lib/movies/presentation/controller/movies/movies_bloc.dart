import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecase/movie_use_case/get_popular_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecase/movie_use_case/get_top_rated_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecase/movie_use_case/get_up_coming_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies/movies_events.dart';
import 'package:movies_app/movies/presentation/controller/movies/movies_state.dart';


class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovieUsecase getNowPlayingMovieUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MovieBloc(this.getNowPlayingMovieUsecase, this.getTopRatedMoviesUsecase,
      this.getPopularMoviesUsecase)
      : super(const MoviesState()) {

    on<GetUpComingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetUpComingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMovieUsecase(const NoParameters());

    result.fold(
        (l) => emit(
              state.copyWith(
                upComingState: RequestState.error,
                upComingmessage: l.message,
              ),
            ),
        (r) => emit(state.copyWith(
              upComingState: RequestState.loaded,
              upComingMovies: r,
            )));
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getPopularMoviesUsecase(const NoParameters());
    result.fold(
          (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularmessage: l.message,
        ),
      ),
          (r) => emit(
        state.copyWith(
          popularState: RequestState.loaded,
          popularMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getTopRatedMoviesUsecase(const NoParameters());
    result.fold(
          (l) => emit(state.copyWith(
        topRatedState: RequestState.error,
        topRatedmessage: l.message,
      )),
          (r) => emit(
        state.copyWith(
          topRatedState: RequestState.loaded,
          topRatedMovies: r,
        ),
      ),
    );
  }
}
