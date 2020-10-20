import 'dart:convert';

List<Anime> animeFromJson(String str) {
    final jsonData = json.decode(str);
    return List<Anime>.from(jsonData.map((x) => Anime.fromJson(x)));
}

String animeToJson(List<Anime> data) {
    final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class Anime {
    int animeId;
    int seasonId;
    String episodeTitle;
    String nameChi;
    String nameJpn;
    int isEnded;
    String seasonTitle;
    int aired;
    int isHidden;
    String lastUpdated;

    Anime({
        this.animeId,
        this.seasonId,
        this.episodeTitle,
        this.nameChi,
        this.nameJpn,
        this.isEnded,
        this.seasonTitle,
        this.aired,
        this.isHidden,
        this.lastUpdated,
    });

    factory Anime.fromJson(Map<String, dynamic> json) => Anime(
        animeId: json["anime_id"],
        seasonId: json["season_id"],
        episodeTitle: json["episode_title"],
        nameChi: json["name_chi"],
        nameJpn: json["name_jpn"],
        isEnded: json["is_ended"],
        seasonTitle: json["season_title"],
        aired: json["aired"],
        isHidden: json["is_hidden"],
        lastUpdated: json["last_updated"],
    );

    Map<String, dynamic> toJson() => {
        "anime_id": animeId,
        "season_id": seasonId,
        "episode_title": episodeTitle,
        "name_chi": nameChi,
        "name_jpn": nameJpn,
        "is_ended": isEnded,
        "season_title": seasonTitle,
        "aired": aired,
        "is_hidden": isHidden,
        "last_updated": lastUpdated,
    };
}