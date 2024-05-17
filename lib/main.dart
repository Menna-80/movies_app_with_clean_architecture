import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/core/utils/app_string.dart';
import 'package:movies_app/core/utils/services_locator.dart';
import 'package:movies_app/movies/domain/entities/favorite_movies.dart';
import 'package:movies_app/movies/presentation/controller/favorites/favorites_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies/movies_events.dart';
import 'package:movies_app/movies/presentation/controller/search/search_bloc.dart';

import 'package:path_provider/path_provider.dart';

import 'movies/presentation/controller/movie_details/movie_details_bloc.dart';
import 'movies/presentation/controller/movies/movies_bloc.dart';
import 'movies/presentation/screens/movies_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  Hive.init(( await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(FavoritesMoviesAdapter());
  await Hive.openBox('FavoriteItems');
  ServicesLocator().setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
            getIt<MovieBloc>()
              ..add(GetUpComingMoviesEvent())..add(
                GetPopularMoviesEvent())..add(GetTopRatedMoviesEvent()),
          ),
          BlocProvider(
            create: (context) => getIt<MovieDetailsBloc>(),
          ),
          BlocProvider(
              create: (context) => getIt<SearchBloc>()
          ),
          BlocProvider(
              create: (context) => getIt<FavoritesBloc>()..add(GetFavoriteMoviesEvent())
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppString.appName,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.grey.shade800,
          ),
          home:  MoviesScreen(),
        ));
  }
}
