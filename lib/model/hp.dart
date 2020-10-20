import 'dart:convert';

Hp hpFromJson(String str) {
  final jsonData = json.decode(str);
  return Hp.fromJson(jsonData);
}

String hpToJson(Hp data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Hp {
  Calendar calendar;
  List<Featured> featured;

  Hp({
    this.calendar,
    this.featured,
  });

  factory Hp.fromJson(Map<String, dynamic> json) => Hp(
        calendar: Calendar.fromJson(json["calendar"]),
        featured: List<Featured>.from(
            json["featured"].map((x) => Featured.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "calendar": calendar.toJson(),
        "featured": List<dynamic>.from(featured.map((x) => x.toJson())),
      };
}

class Calendar {
  String title;
  List<Day> days;

  Calendar({
    this.title,
    this.days,
  });

  factory Calendar.fromJson(Map<String, dynamic> json) => Calendar(
        title: json["title"],
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "days": List<dynamic>.from(days.map((x) => x.toJson())),
      };
}

class Day {
  String label;
  List<AnimeSimple> animes;

  Day({
    this.label,
    this.animes,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        label: json["label"],
        animes:
            List<AnimeSimple>.from(json["animes"].map((x) => AnimeSimple.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "animes": List<dynamic>.from(animes.map((x) => x.toJson())),
      };
}

class AnimeSimple {
  String name;
  String path;

  AnimeSimple({
    this.name,
    this.path,
  });

  factory AnimeSimple.fromJson(Map<String, dynamic> json) => AnimeSimple(
        name: json["name"],
        path: json["path"] == null ? null : json["path"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "path": path == null ? null : path,
      };
}

class Featured {
  String nameChi;
  String seasonTitle;
  int animeId;
  int seasonId;
  String posterLarge;

  Featured({
    this.nameChi,
    this.seasonTitle,
    this.animeId,
    this.seasonId,
    this.posterLarge,
  });

  factory Featured.fromJson(Map<String, dynamic> json) => Featured(
        nameChi: json["name_chi"],
        seasonTitle: json["season_title"],
        animeId: json["anime_id"],
        seasonId: json["season_id"],
        posterLarge: json["poster_large"],
      );

  Map<String, dynamic> toJson() => {
        "name_chi": nameChi,
        "season_title": seasonTitle,
        "anime_id": animeId,
        "season_id": seasonId,
        "poster_large": posterLarge,
      };
}