part of 'search_bloc.dart';

class MovieSearchState extends Equatable {

  final List<Movie> searchMovies;
  final String searchMessage;
  final RequestState searchState;

  const MovieSearchState({
    this.searchMessage='',
    this.searchState=RequestState.loading,
    this.searchMovies=const[]
});

  MovieSearchState copyWith({
    RequestState?searchState,
    String? searchMessage,
    List<Movie>? searchMovies

}){
    return MovieSearchState(
      searchMovies: searchMovies?? this.searchMovies,
      searchMessage: searchMessage??this.searchMessage,
      searchState: searchState ?? this.searchState
    );
  }

  @override
  List<Object?> get props => [
    searchMovies,
    searchMessage,
    searchState
  ];
  }



