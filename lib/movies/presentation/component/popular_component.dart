import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/constance.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controller/movies/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies/movies_state.dart';
import 'package:movies_app/movies/presentation/screens/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MovieBloc,MoviesState>(
      buildWhen: (previous, current)=> previous.popularState != current.popularState,
      builder: (context,state){
        switch(state.popularState){

          case RequestState.loading:
            return const SizedBox(
                height: 170.0,
                child: Center(child: CircularProgressIndicator()));
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>MovieDetailScreen(id:movie.id ,)));
                      },
                      child:Container(
                        height: 100,
                        width: 135,
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
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                                  child: CachedNetworkImage(
                                    width: 120.0,
                                    fit: BoxFit.cover,
                                    imageUrl: ApiConstance.imageUrl(movie.backdropPath??''),
                                    placeholder: (context, url) => Shimmer.fromColors(
                                      baseColor: Colors.grey[850]!,
                                      highlightColor: Colors.grey[800]!,
                                      child: Container(
                                        height: 170.0,
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
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
                                  movie.title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left:8,
                                  right:8,
                                  bottom: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return  SizedBox(
                height: 170.0,
                child: Center(child: Text(state.upComingmessage)));
        }

      },

    );
  }
}
