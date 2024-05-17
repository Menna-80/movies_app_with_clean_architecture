import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_string.dart';
import 'package:movies_app/core/utils/services_locator.dart';
import 'package:movies_app/movies/domain/entities/favorite_movies.dart';
import 'package:movies_app/movies/presentation/component/favorite_vertical_list.dart';
import 'package:movies_app/movies/presentation/controller/favorites/favorites_bloc.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          getIt<FavoritesBloc>()..add(GetFavoriteMoviesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppString.watchlist),
        ),
        body: BlocBuilder<FavoritesBloc, FavoriteMoviesState>(
            builder: (context, state) {
          if (state.requestStatus == FavoritesRequestStatus.loading) {
            return const CircularProgressIndicator();
          } else if (state.requestStatus == FavoritesRequestStatus.loaded) {
            return WatchlistWidget(items: state.favoritesMovies);
          } else if (state.requestStatus == FavoritesRequestStatus.empty) {
            return const Center(
              child: Text('Empty'),
            );
          }else {
            context.read<FavoritesBloc>().add(GetFavoriteMoviesEvent());
            return Text(state.favoritesMessage);

          }
        }),
      ),
    );
  }
}

class WatchlistWidget extends StatelessWidget {
const WatchlistWidget({
super.key,
required this.items,
});

final List<FavoritesMovies> items;

@override
Widget build(BuildContext context) {
  return ListView.separated(
  //  shrinkWrap: true,
    itemCount: items.length,


    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 6,
    ),
    itemBuilder: (context, index) {
        return  VerticalListViewCard(media: items[index]);
    },
    separatorBuilder: (context, index) => const SizedBox(height: 10),
  );
}
}
