import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_string.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/core/utils/services_locator.dart';
import 'package:movies_app/movies/presentation/component/app_bar.dart';
import 'package:movies_app/movies/presentation/component/cast_component.dart';
import 'package:movies_app/movies/presentation/component/custom_button.dart';
import 'package:movies_app/movies/presentation/component/more_like_this_component.dart';
import 'package:movies_app/movies/presentation/component/movie_details_component.dart';
import 'package:movies_app/movies/presentation/component/side_bar/navigation_drawer.dart';
import 'package:movies_app/movies/presentation/component/video_component.dart';
import 'package:movies_app/movies/presentation/controller/movie_details/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movie_details/movie_details_state.dart';


class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    context.read<MovieDetailsBloc>().add(GetMovieVideoEvent(id));
    return BlocProvider(
      create: (BuildContext context) => getIt<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(id))
        ..add(GetMovieRecommendationsEvent(id))
        ..add(GetMovieCastEvent(id)),
      child: Scaffold(
        drawer: Navigation(),
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            switch (state.movieDetailsState) {
              case RequestState.loading:
                return const Center(child: CircularProgressIndicator());
              case RequestState.loaded:
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MovieAppBar(),
                      MovieDetailsComponent(
                        movie: state.movieDetails!,
                      ),
                      Center(
                        child:
                            customButton(context, 'Watch Trailers', () async {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              print(state.movieVideo);
                              return const VideoScreen();
                            },
                          ));
                          //context.read<MovieDetailsBloc>().add(GetMovieVideoEvent(id));
                        }),
                      ),
                      const SizedBox(height: 5.0),
                      FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            AppString.cast,
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                      const CastCrewComponent(),
                      FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            AppString.moreLikeThis,
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                      const MoreLikeThisComponent(),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                );
              case RequestState.error:
                return Text(state.movieDetailsMessage);
            }
          },
        ),
      ),
    );
  }
}
