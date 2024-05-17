part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

}
class GetMovieDetailsEvent extends MovieDetailsEvent{
  final int id;

 const GetMovieDetailsEvent(this.id);
  @override
  List<Object> get props => [id];
}

class GetMovieRecommendationsEvent extends MovieDetailsEvent{
  final int id;

  @override
  List<Object?> get props =>[id];

 const GetMovieRecommendationsEvent(this.id);
}
class GetMovieCastEvent extends MovieDetailsEvent{
  final int id;

  @override
  List<Object?> get props =>[id];

  const GetMovieCastEvent(this.id);
}

class GetMovieVideoEvent extends MovieDetailsEvent{
  final int id;

  @override
  List<Object?> get props =>[id];

  const GetMovieVideoEvent(this.id);
}

class GetMovieSearchEvent extends MovieDetailsEvent{
  final int id;

  @override
  List<Object?> get props =>[id];

  const GetMovieSearchEvent(this.id);
}