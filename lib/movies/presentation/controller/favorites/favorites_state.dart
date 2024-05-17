part of 'favorites_bloc.dart';
enum FavoritesRequestStatus {
  empty,
  loading,
  loaded,
  error,
  itemAdded,
  itemRemoved,
  isItemAdded,
}


class FavoriteMoviesState extends Equatable {
 const FavoriteMoviesState(
      {
        this.requestStatus = FavoritesRequestStatus.loading,
        this.favoritesMovies =const [],
        this.favoritesMessage = '',
        this.id
      });


  final FavoritesRequestStatus requestStatus;
  final List<FavoritesMovies> favoritesMovies;
  final String favoritesMessage;
  final int? id;


 FavoriteMoviesState copyWith({
   FavoritesRequestStatus? requestStatus,
   List<FavoritesMovies>? favoritesMovies,
   String ? favoritesMessage,
    int? id,

 }) {
   return FavoriteMoviesState(
     favoritesMessage: favoritesMessage ?? this.favoritesMessage,
     favoritesMovies: favoritesMovies ?? this.favoritesMovies,
     requestStatus: requestStatus ?? this.requestStatus,
     id: id ?? this.id
   );
}


  @override

  List<Object?> get props =>[requestStatus,favoritesMovies,favoritesMessage,id];


}
