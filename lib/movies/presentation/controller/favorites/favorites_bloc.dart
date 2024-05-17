import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/favorite_movies.dart';
import 'package:movies_app/movies/domain/usecase/favorite_use_case/add_favorite_movie_use_case.dart';
import 'package:movies_app/movies/domain/usecase/favorite_use_case/check_favorite_movie_use_case.dart';
import 'package:movies_app/movies/domain/usecase/favorite_use_case/delete_favorite_movie_use_case.dart';
import 'package:movies_app/movies/domain/usecase/favorite_use_case/get_favorite_movie_use_case.dart';


part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoriteMoviesState> {
  final AddFavoritesMovieUseCase addFavoritesMovieUseCase;
  final CheckFavoritesMovieUseCase checkFavoritesMovieUseCase;
  final DeleteFavoritesMoviesUsecase deleteFavoritesMoviesUsecase;
  final GetFavoritesMoviesUsecase getFavoritesMoviesUsecase;
  FavoritesBloc(
    this.getFavoritesMoviesUsecase,
    this.deleteFavoritesMoviesUsecase,
    this.checkFavoritesMovieUseCase,
    this.addFavoritesMovieUseCase,
  ) : super(const FavoriteMoviesState()) {
    on<GetFavoriteMoviesEvent>(getFavorites);
    on<AddFavoriteMoviesEvent>(addFavorites);
    on<DeleteFavoriteMoviesEvent>(deleteFavorites);
    on<CheckFavoriteMoviesEvent>(checkFavorites);
  }

  FutureOr<void> getFavorites(
      GetFavoriteMoviesEvent event, Emitter<FavoriteMoviesState> emit) async {
    emit(const FavoriteMoviesState(
        requestStatus: FavoritesRequestStatus.loading
    ));
    final result = await getFavoritesMoviesUsecase.call(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
              requestStatus: FavoritesRequestStatus.error,
              favoritesMessage: l.message,
            )),
        (r) {
          if(r.isEmpty){
            emit(const FavoriteMoviesState(
              requestStatus: FavoritesRequestStatus.empty,
            ));
          }
          else{
            emit(state.copyWith(
              requestStatus: FavoritesRequestStatus.loaded,
              favoritesMovies: r,
            ));
          }
        });
  }

  FutureOr<void> addFavorites(
      AddFavoriteMoviesEvent event, Emitter<FavoriteMoviesState> emit) async {
    emit(const FavoriteMoviesState(
      requestStatus: FavoritesRequestStatus.loading
    ));
    final result = await addFavoritesMovieUseCase.call(event.favoritesMovies);
    result.fold(
        (l) => emit(state.copyWith(
              requestStatus: FavoritesRequestStatus.error,
              favoritesMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              requestStatus: FavoritesRequestStatus.itemAdded,
              id: r,
            )));
  }

  FutureOr<void> deleteFavorites(DeleteFavoriteMoviesEvent event,
      Emitter<FavoriteMoviesState> emit) async {
    emit(const FavoriteMoviesState(
        requestStatus: FavoritesRequestStatus.loading
    ));
    final result = await deleteFavoritesMoviesUsecase.call(event.index);
    result.fold(
        (l) => emit(state.copyWith(
              requestStatus: FavoritesRequestStatus.error,
              favoritesMessage: l.message,
        )),
        (r) => emit(state.copyWith(
              requestStatus: FavoritesRequestStatus.itemRemoved,
            )));
  }

  FutureOr<void> checkFavorites(
      CheckFavoriteMoviesEvent event, Emitter<FavoriteMoviesState> emit) async {
    emit(const FavoriteMoviesState(
        requestStatus: FavoritesRequestStatus.loading
    ));
    final result = await checkFavoritesMovieUseCase.call(event.id);
    result.fold(
        (l) => emit(state.copyWith(
              requestStatus: FavoritesRequestStatus.error,
              favoritesMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              requestStatus: FavoritesRequestStatus.isItemAdded,
              id: r,
            )));
  }
}
