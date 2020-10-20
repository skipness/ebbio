import 'package:ebbio/model/anime_detail.dart';
import 'package:ebbio/network/api_provider.dart';

class AnimeDetailRepository {
  Future<AnimeDetail> getAnimeDetail(int id) {
    return ApiProvider().getAnimeDetail(id);
  }
}
