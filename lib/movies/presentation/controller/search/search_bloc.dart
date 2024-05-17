
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/usecase/movie_use_case/search_use_case.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, MovieSearchState> {
  final GetSearchUseCase getSearchUseCase;
  SearchBloc(this.getSearchUseCase,) : super(const MovieSearchState()) {
    on<GetSearchEvent>(_getSearch);
  }



  FutureOr<void> _getSearch(GetSearchEvent event, Emitter<MovieSearchState> emit)async {
    final result = await getSearchUseCase(SearchParameters(movieName: event.name));
    result.fold(
            (l) => emit(state.copyWith(searchState: RequestState.error, searchMessage: l.message)),
            (r) => emit(state.copyWith(
            searchState: RequestState.loaded, searchMovies: r))
    );
  }
}
