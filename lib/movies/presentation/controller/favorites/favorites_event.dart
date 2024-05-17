part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable{
  const FavoritesEvent();
}


class AddFavoriteMoviesEvent extends FavoritesEvent{
  final FavoritesMovies favoritesMovies;
  const AddFavoriteMoviesEvent({required this.favoritesMovies});

  @override
  List<Object?> get props =>[favoritesMovies];

}



class CheckFavoriteMoviesEvent extends FavoritesEvent{
  final int id;

  @override
  List<Object?> get props =>[id];

  const CheckFavoriteMoviesEvent( {required this.id});
}

class GetFavoriteMoviesEvent extends FavoritesEvent{
  @override
  List<Object?> get props =>[];
}

class DeleteFavoriteMoviesEvent extends FavoritesEvent{
  final int index;

  @override
  List<Object?> get props =>[index];

  const DeleteFavoriteMoviesEvent(this.index);
}
