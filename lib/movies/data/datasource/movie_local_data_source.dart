import 'package:hive/hive.dart';
import 'package:movies_app/movies/data/model/favorite_model.dart';

abstract class BaseFavoritesMovieLocalDataSource{
  Future<List<FavoritesMoviesModel>>getFavoritemovie();
  Future<int> addFavoritesItem(FavoritesMoviesModel item);
  Future<void> removeFavoritesItem(int index);
  Future<int> checkIfItemAdded(int tmdbId);

}
class FavoritesMovieLocalDataSource extends BaseFavoritesMovieLocalDataSource{
  final Box box = Hive.box('FavoriteItems');

  @override
  Future<int> addFavoritesItem(FavoritesMoviesModel item)async {
    return await box.add(item);
  }

  @override
  Future<int> checkIfItemAdded(int tmdbId) async{
   return box.values.toList().indexWhere((element) => element.id == tmdbId);

  }

  @override
  Future<List<FavoritesMoviesModel>> getFavoritemovie()async {
    return box.values
        .map((e) => FavoritesMoviesModel.fromEntity(e))
        .toList()
        .reversed
        .toList();
  }

  @override
  Future<void> removeFavoritesItem(int index) async{
    return await box.deleteAt(index);
  }

}
