import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/constance.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controller/movies/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies/movies_state.dart';
import 'package:movies_app/movies/presentation/screens/movie_detail_screen.dart';


class UpComingComponent extends StatelessWidget {
  const UpComingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc,MoviesState>(
        buildWhen: (previous, current)=> previous.upComingState != current.upComingState,
        builder: (context,state)
    {
      switch(state.upComingState)
        {
        case RequestState.loading:
          return const SizedBox(
            height: 400.0,
              child: Center(child: CircularProgressIndicator()));

        case RequestState.loaded:
          return Container(
           // duration: const Duration(milliseconds: 300),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,

                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 1.0,
                autoPlay: true,
                enlargeCenterPage: true,

              ),
              items: state.upComingMovies.map(
                    (item) {
                  return GestureDetector(
                    key: const Key('openMovieMinimalDetail'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>MovieDetailScreen(id: item.id,)));
                    },
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                // fromLTRB
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0, 0.3, 0.5, 1],
                            ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: Center(
                            child: CachedNetworkImage(
                              height: 560.0,
                              imageUrl: ApiConstance.imageUrl(item.backdropPath??''),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.redAccent,
                                      size: 16.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      'UPComing'.toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          );

        case RequestState.error:
          return  SizedBox(
            height: 400.0,
              child: Center(child: Text(state.upComingmessage)));
      }
      });
  }
}
