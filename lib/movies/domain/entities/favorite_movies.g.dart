// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movies.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritesMoviesAdapter extends TypeAdapter<FavoritesMovies> {
  @override
  final int typeId = 0;

  @override
  FavoritesMovies read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoritesMovies(
      id: fields[0] as int,
      title: fields[1] as String,
      posterUrl: fields[2] as String,
      voteAverage: fields[3] as double,
      releaseDate: fields[4] as String,
      overview: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoritesMovies obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterUrl)
      ..writeByte(3)
      ..write(obj.voteAverage)
      ..writeByte(4)
      ..write(obj.releaseDate)
      ..writeByte(5)
      ..write(obj.overview);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesMoviesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
