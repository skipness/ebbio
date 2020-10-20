import 'package:ebbio/model/anime.dart';
import 'package:ebbio/network/api_provider.dart';

class AnimeListRepository {
  Future<List<Anime>> getAnimeList() {
    return ApiProvider().getAnimeList();
  }
}
