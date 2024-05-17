import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';


class MoviesState extends Equatable{
  final List<Movie> upComingMovies;
  final String upComingmessage;
  final RequestState upComingState;
  final List<Movie> popularMovies;
  final String popularmessage;
  final RequestState popularState;
  final List<Movie> topRatedMovies;
  final String topRatedmessage;
  final RequestState topRatedState;

  const MoviesState({
    this.upComingMovies= const[],
    this.upComingmessage='',
    this.upComingState=RequestState.loading,
    this.popularMovies= const[],
    this.popularmessage='',
    this.popularState=RequestState.loading,
    this.topRatedMovies= const[],
    this.topRatedmessage='',
    this.topRatedState=RequestState.loading

  });
MoviesState copyWith({
   List<Movie>? upComingMovies,
   String? upComingmessage,
   RequestState? upComingState,
   List<Movie>? popularMovies,
   String? popularmessage,
   RequestState? popularState,
   List<Movie>? topRatedMovies,
   String? topRatedmessage,
   RequestState? topRatedState,
}){
  return MoviesState(
      upComingMovies: upComingMovies??this.upComingMovies,
      upComingmessage: upComingmessage?? this.upComingmessage,
      upComingState: upComingState??this.upComingState,
      popularMovies: popularMovies??this.popularMovies,
      popularmessage: popularmessage??this.popularmessage,
      popularState: popularState??this.popularState,
      topRatedMovies: topRatedMovies??this.topRatedMovies,
      topRatedmessage: topRatedmessage??this.topRatedmessage,
      topRatedState: topRatedState??this.topRatedState,





  );
}
  @override
  List<Object> get props =>[
    upComingMovies,
    upComingmessage,
    upComingState,
    popularMovies,
    popularState,
    popularmessage,
    topRatedState,
    topRatedmessage,
    topRatedMovies
  ];
}