import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/component/grid_view_card.dart';
import 'package:movies_app/movies/presentation/controller/search/search_bloc.dart';


class SearchGridView extends StatelessWidget {
  const SearchGridView({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, MovieSearchState>(
      builder: (context, state) {
        return Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: state.searchMovies.length,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              childAspectRatio: 0.55,
            ),
            itemBuilder: (context, index) {
              return GridViewCard(item: state.searchMovies[index]);
            },
          ),
        );
      },
    );
  }
}

