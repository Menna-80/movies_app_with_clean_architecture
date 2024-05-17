import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/movies/presentation/controller/search/search_bloc.dart';
import 'package:movies_app/movies/presentation/screens/search_screen.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, MovieSearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
          ),
          child: Row(
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu_rounded)
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/logo.png',
                  color: Colors.white,
                  height: 36,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => const SearchView()));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}