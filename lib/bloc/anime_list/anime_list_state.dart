import 'package:ebbio/model/anime.dart';

abstract class AnimeListState {}

class AnimeListUninitialized extends AnimeListState {
  @override
  String toString() => 'Anime List Uninitialized';
}

class AnimeListError extends AnimeListState {
  @override
  String toString() => 'Anime List Error';
}

class AnimeListLoaded extends AnimeListState {
  final List<Anime> animeList;

  AnimeListLoaded({
    this.animeList,
  });

  @override
  String toString() => 'Anime List Loaded { anime list: $animeList }';
}
