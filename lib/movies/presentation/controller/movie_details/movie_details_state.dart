
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/cast_crew.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_app/movies/domain/entities/videos.dart';


class MovieDetailsState extends Equatable {
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final MovieDetails? movieDetails;

  final RequestState movieRecommendationState;
  final String movieRecommendationMessage;
  final List<MovieRecommendation> movieRecommendations;

  final RequestState movieCastState;
  final String movieCastMessage;
  final List<CastCrew> movieCast;

  final RequestState movieVideoState;
  final String movieVideoMessage;
  final List<VideosEntity> movieVideo;

  const MovieDetailsState({
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.movieDetails,
    this.movieRecommendationState = RequestState.loading,
    this.movieRecommendationMessage = '',
    this.movieRecommendations = const [],
    this.movieCastState = RequestState.loading,
    this.movieCastMessage = '',
    this.movieCast = const [],
    this.movieVideo = const [],
    this.movieVideoMessage = '',
    this.movieVideoState = RequestState.loading,
  });

  MovieDetailsState copyWith({
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    MovieDetails? movieDetails,
    RequestState? movieRecommendationState,
    String? movieRecommendationMessage,
    List<MovieRecommendation>? movieRecommendations,
    RequestState? movieCastState,
    String? movieCastMessage,
    List<CastCrew>? movieCast,
    RequestState? movieVideoState,
    String? movieVideoMessage,
    List<VideosEntity>? movieVideo,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieRecommendationMessage:
          movieRecommendationMessage ?? this.movieRecommendationMessage,
      movieRecommendations: movieRecommendations ?? this.movieRecommendations,
      movieRecommendationState:
          movieRecommendationState ?? this.movieRecommendationState,
      movieCast: movieCast ?? this.movieCast,
      movieCastState: movieCastState ?? this.movieCastState,
      movieCastMessage: movieCastMessage ?? this.movieCastMessage,
      movieVideo: movieVideo ?? this.movieVideo,
      movieVideoMessage: movieVideoMessage ?? this.movieVideoMessage,
      movieVideoState: movieVideoState ?? this.movieVideoState,
    );
  }

  @override
  List<Object?> get props => [
        movieDetailsState,
        movieDetails,
        movieDetailsMessage,
        movieRecommendationState,
        movieRecommendations,
        movieRecommendationMessage,
        movieCastMessage,
        movieCast,
        movieCastState,
        movieVideo,
        movieVideoState,
        movieVideoMessage
      ];
}
