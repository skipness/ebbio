import 'package:ebbio/model/anime_detail.dart';

abstract class AnimeDetailState {}

class AnimeDetailUninitialized extends AnimeDetailState {
  @override
  String toString() => 'Anime Detail Uninitialized';
}

class AnimeDetailError extends AnimeDetailState {
  @override
  String toString() => 'Anime Detail Error';
}

class AnimeDetailLoaded extends AnimeDetailState {
  final AnimeDetail animeDetail;

  AnimeDetailLoaded({
    this.animeDetail,
  });

  @override
  String toString() => 'Anime Detail Loaded { anime detail: $animeDetail }';
}
