abstract class AnimeDetailEvent {
  int id;
}

class FetchAnimeDetail extends AnimeDetailEvent {
  int id;

  FetchAnimeDetail(this.id);

  @override
  String toString() => 'Fetch Anime Detail';
}
