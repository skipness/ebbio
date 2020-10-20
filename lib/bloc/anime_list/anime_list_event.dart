abstract class AnimeListEvent {}

class FetchAnimeList extends AnimeListEvent {
  @override
  String toString() => 'Fetch Anime List';
}
