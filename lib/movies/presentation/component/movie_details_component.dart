import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/app_string.dart';
import 'package:movies_app/core/utils/constance.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/favorite_movies.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/presentation/controller/favorites/favorites_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movie_details/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movie_details/movie_details_state.dart';


class MovieDetailsComponent extends StatelessWidget {
  final MovieDetails movie;

  const MovieDetailsComponent({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<FavoritesBloc>().add(CheckFavoriteMoviesEvent(id: movie.id));
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
          previous.movieDetailsState != current.movieDetailsState,
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loading:
            return const SizedBox(
                height: 170.0,
                child: Center(child: CircularProgressIndicator()));
          case RequestState.loaded:
            return Column(
              children: [
                Stack(
                  children: [
                    FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 1.0, 1.0],
                          ).createShader(
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                          imageUrl: ApiConstance.imageUrl(
                              state.movieDetails!.backdropPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 16,
                        right: 16,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            movie.isAdded
                                ? context
                                    .read<FavoritesBloc>()
                                    .add(DeleteFavoriteMoviesEvent(movie.tmdbID!))
                                : context.read<FavoritesBloc>().add(
                                      AddFavoriteMoviesEvent(
                                        favoritesMovies:
                                            FavoritesMovies.fromMovieDetails(
                                                movie),
                                      ),
                                    );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black26),
                            child:
                                BlocConsumer<FavoritesBloc, FavoriteMoviesState>(
                              listener: (context, state) {
                                if (state.requestStatus ==
                                    FavoritesRequestStatus.itemAdded) {
                                  movie.tmdbID = state.id;
                                  movie.isAdded = true;
                                } else if (state.requestStatus ==
                                    FavoritesRequestStatus.itemRemoved) {
                                  movie.tmdbID = null;
                                  movie.isAdded = false;
                                } else if (state.requestStatus ==
                                        FavoritesRequestStatus.isItemAdded &&
                                    state.id != -1) {
                                  movie.tmdbID = state.id;
                                  movie.isAdded = true;
                                }
                              },
                              builder: (context, state) {
                                return Icon(
                                  movie.isAdded
                                      ? Icons.bookmark_rounded
                                      : Icons.bookmark_border_rounded,
                                  color: movie.isAdded ? Colors.red : Colors.grey,
                                  size: 30,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.movieDetails!.title,
                            style: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            )),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.0,
                                horizontal: 8.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                state.movieDetails!.releaseDate.split(',')[0],
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20.0,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  (state.movieDetails!.voteAverage / 2)
                                      .toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  '(${state.movieDetails!.voteAverage})',
                                  style: const TextStyle(
                                    fontSize: 1.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16.0),
                            Text(
                              _showDuration(state.movieDetails!.runTime),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          state.movieDetails!.overView,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '${AppString.genres}: ${_showGenres(state.movieDetails!.genres)}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          case RequestState.error:
            return SizedBox(
                height: 170.0,
                child: Center(child: Text(state.movieDetailsMessage)));
        }
      },
    );
  }
}

String _showGenres(List<Genres> genres) {
  String result = '';
  for (var genre in genres) {
    result += '${genre.name}, ';
  }

  if (result.isEmpty) {
    return result;
  }

  return result.substring(0, result.length - 2);
}

String _showDuration(int runtime) {
  final int hours = runtime ~/ 60;
  final int minutes = runtime % 60;

  if (hours > 0) {
    return '${hours}h ${minutes}m';
  } else {
    return '${minutes}m';
  }
}
