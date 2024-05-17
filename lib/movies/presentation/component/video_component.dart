import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_string.dart';
import 'package:movies_app/movies/presentation/controller/movie_details/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movie_details/movie_details_state.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        buildWhen: (previous, current) =>previous.movieVideoState != current.movieVideoState,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                AppString.watchTrailers,
              ),
            ),
            body:ConditionalBuilder(
              condition:state.movieVideo.isNotEmpty,
              builder: (BuildContext context) {

                YoutubePlayerController controller = YoutubePlayerController(
                    initialVideoId: state.movieVideo[0].key,
                    flags: const YoutubePlayerFlags(
                      autoPlay: true,
                      mute: false,
                    ));
                return YoutubePlayerBuilder(
                  player: YoutubePlayer(controller: controller),
                  builder: (context, player) {
                    return Column(
                      children: [
                        player,
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                for (int i = 0; i < state.movieVideo.length; i++)
                                  Container(
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller.load(state.movieVideo[i].key);

                                              controller.play();
                                            },
                                            child: CachedNetworkImage(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    3,
                                                imageUrl:
                                                YoutubePlayer.getThumbnail(
                                                  videoId:
                                                  state.movieVideo[i].key,
                                                )),
                                          ),
                                          Expanded(
                                            child: Text(
                                              state.movieVideo[i].name,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),),
                      ],
                    );
                  },
                );
              },
              fallback: (BuildContext context) {
                return  SizedBox(
                    height: 170.0,
                    child: Center(child: Text(state.movieVideoMessage)));
              },

            ),
          );

        }, );
  }


}
