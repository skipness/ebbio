import 'dart:convert';

AnimeDetail animeDetailFromJson(String str) {
  final jsonData = json.decode(str);
  return AnimeDetail.fromJson(jsonData);
}

String animeDetailToJson(AnimeDetail data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class AnimeDetail {
  bool success;
  int status;
  ListClass list;

  AnimeDetail({
    this.success,
    this.status,
    this.list,
  });

  factory AnimeDetail.fromJson(Map<String, dynamic> json) => AnimeDetail(
        success: json["success"],
        status: json["status"],
        list: ListClass.fromJson(json["list"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "list": list.toJson(),
      };
}

class ListClass {
  AnimeInfo anime;
  List<Season> seasons;

  ListClass({
    this.anime,
    this.seasons,
  });

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        anime: AnimeInfo.fromJson(json["anime"]),
        seasons:
            List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "anime": anime.toJson(),
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
      };
}

class AnimeInfo {
  int id;
  String nameChi;
  String nameJpn;
  String author;
  String description;
  List<Tag> tags;
  String keywords;
  int isEnded;

  AnimeInfo({
    this.id,
    this.nameChi,
    this.nameJpn,
    this.author,
    this.description,
    this.tags,
    this.keywords,
    this.isEnded,
  });

  factory AnimeInfo.fromJson(Map<String, dynamic> json) => AnimeInfo(
        id: json["id"],
        nameChi: json["name_chi"],
        nameJpn: json["name_jpn"],
        author: json["author"],
        description: json["description"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        keywords: json["keywords"],
        isEnded: json["is_ended"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_chi": nameChi,
        "name_jpn": nameJpn,
        "author": author,
        "description": description,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "keywords": keywords,
        "is_ended": isEnded,
      };
}

class Tag {
  int id;
  String name;
  String color;

  Tag({
    this.id,
    this.name,
    this.color,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
      };
}

class Season {
  int id;
  int animeId;
  String seasonTitle;
  int aired;
  String studio;
  int sortIndex;
  String lastUpdated;
  int isHidden;
  List<Episode> episodes;

  Season({
    this.id,
    this.animeId,
    this.seasonTitle,
    this.aired,
    this.studio,
    this.sortIndex,
    this.lastUpdated,
    this.isHidden,
    this.episodes,
  });

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json["id"],
        animeId: json["anime_id"],
        seasonTitle: json["season_title"],
        aired: json["aired"],
        studio: json["studio"].toString().replaceAll('\n', ',,'),
        sortIndex: json["sort_index"],
        lastUpdated: json["last_updated"],
        isHidden: json["is_hidden"],
        episodes: List<Episode>.from(
            json["episodes"].map((x) => Episode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "anime_id": animeId,
        "season_title": seasonTitle,
        "aired": aired,
        "studio": studio,
        "sort_index": sortIndex,
        "last_updated": lastUpdated,
        "is_hidden": isHidden,
        "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
      };
}

class Episode {
  String createdAt;
  int duration;
  String id;
  bool isRaw;
  String sl;
  String title;
  int videoWidth;
  int videoHeight;

  Episode({
    this.createdAt,
    this.id,
    this.isRaw,
    this.sl,
    this.title,
    this.duration,
    this.videoWidth,
    this.videoHeight,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        createdAt: json["created_at"],
        id: json["id"],
        isRaw: json["is_raw"],
        sl: json["sl"],
        title: json["title"],
        duration: json["duration"],
        videoWidth: json["video_width"],
        videoHeight: json["video_height"],
      );

  Map<String, dynamic> toJson() => {
        "create_at": createdAt,
        "id": id,
        "is_raw": isRaw,
        "sl": sl,
        "title": title,
        "duration": duration,
        "video_width": videoWidth,
        "video_height": videoHeight,
      };
}
