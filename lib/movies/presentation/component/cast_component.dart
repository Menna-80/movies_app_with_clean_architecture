import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/constance.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controller/movie_details/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movie_details/movie_details_state.dart';


class CastCrewComponent extends StatelessWidget {
  const CastCrewComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MovieDetailsBloc,MovieDetailsState>(
      buildWhen: (previous, current)=> previous.movieCastState != current.movieCastState,
      builder: (context,state){
        switch(state.movieCastState){

          case RequestState.loading:
            return const SizedBox(
                height: 170.0,
                child: Center(child: CircularProgressIndicator()));
          case RequestState.loaded:
            return Container(
              height:260,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.movieCast.length,
                itemBuilder: (context, index) {
                  final castEntity = state.movieCast[index];
                  return Container(
                    height: 100,
                    width: 160,
                    child: Card(
                      elevation: 1,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8),
                              ),
                              child: CachedNetworkImage(
                                height: 100,
                                width: 160,
                                imageUrl:
                                ApiConstance.imageUrl(castEntity.profilePath??''),
                                fit: BoxFit.fitWidth,
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                              ),

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Text(
                              castEntity.name,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left:8,
                              right:8,
                              bottom: 8,
                            ),
                            child: Text(
                              castEntity.character,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );

          case RequestState.error:
            return  SizedBox(
                height: 170.0,
                child: Center(child: Text(state.movieRecommendationMessage)));
        }

      },

    );
  }
}