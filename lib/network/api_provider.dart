import 'package:dio/dio.dart';
import 'package:ebbio/model/anime.dart';
import 'package:ebbio/model/anime_detail.dart';
import 'package:ebbio/model/hp.dart';
import 'package:lzstring/lzstring.dart';

class ApiProvider {
  static final ApiProvider _instance = ApiProvider._internal();
  factory ApiProvider() => _instance;
  Dio _dio;

  ApiProvider._internal() {
    if (_dio == null) {
      _dio = Dio(BaseOptions(
        baseUrl: "https://ebb.io/_",
        responseType: ResponseType.plain,
      ));
      _dio.interceptors.add(InterceptorsWrapper(
          onResponse: (Response response) async =>
              await LZString.decompressFromUTF16(response.data)));
    }
  }

  Future<Hp> getHP() async {
    Response response = await _dio.get('/hpdata');
    return hpFromJson(response.data);
  }

  Future<List<Anime>> getAnimeList() async {
    Response response = await _dio.get('/anime_list');
    return animeFromJson(response.data);
  }

  Future<AnimeDetail> getAnimeDetail(int id) async {
    Response response = await _dio.get('/season_list/$id');
    return animeDetailFromJson(response.data);
  }

  Future<bool> checkVideoPlayable(String url) async {
    Response response = await _dio.head(url, options: Options(
      validateStatus: (statusCode) {
        // if (statusCode == 200 || statusCode == 401) return true;
        // return false;
        return statusCode < 500;
      },
    ));
    return response.statusCode == 200;
  }
}
