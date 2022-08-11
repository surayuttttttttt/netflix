// To parse this JSON data, do
//
//     final posterModel = posterModelFromJson(jsonString);

import 'dart:convert';

PosterModel posterModelFromJson(String str) => PosterModel.fromJson(json.decode(str));

String posterModelToJson(PosterModel data) => json.encode(data.toJson());

class PosterModel {
    PosterModel({
        this.imDbId,
        this.title,
        this.fullTitle,
        this.type,
        this.year,
        this.posters,
        this.backdrops,
        this.errorMessage,
    });

    final String imDbId;
    final String title;
    final String fullTitle;
    final String type;
    final String year;
    final List<Backdrop> posters;
    final List<Backdrop> backdrops;
    final String errorMessage;

    factory PosterModel.fromJson(Map<String, dynamic> json) => PosterModel(
        imDbId: json["imDbId"] == null ? null : json["imDbId"],
        title: json["title"] == null ? null : json["title"],
        fullTitle: json["fullTitle"] == null ? null : json["fullTitle"],
        type: json["type"] == null ? null : json["type"],
        year: json["year"] == null ? null : json["year"],
        posters: json["posters"] == null ? null : List<Backdrop>.from(json["posters"].map((x) => Backdrop.fromJson(x))),
        backdrops: json["backdrops"] == null ? null : List<Backdrop>.from(json["backdrops"].map((x) => Backdrop.fromJson(x))),
        errorMessage: json["errorMessage"] == null ? null : json["errorMessage"],
    );

    Map<String, dynamic> toJson() => {
        "imDbId": imDbId == null ? null : imDbId,
        "title": title == null ? null : title,
        "fullTitle": fullTitle == null ? null : fullTitle,
        "type": type == null ? null : type,
        "year": year == null ? null : year,
        "posters": posters == null ? null : List<dynamic>.from(posters.map((x) => x.toJson())),
        "backdrops": backdrops == null ? null : List<dynamic>.from(backdrops.map((x) => x.toJson())),
        "errorMessage": errorMessage == null ? null : errorMessage,
    };
}

class Backdrop {
    Backdrop({
        this.id,
        this.link,
        this.aspectRatio,
        this.language,
        this.width,
        this.height,
    });

    final String id;
    final String link;
    final double aspectRatio;
    final Language language;
    final int width;
    final int height;

    factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
        id: json["id"] == null ? null : json["id"],
        link: json["link"] == null ? null : json["link"],
        aspectRatio: json["aspectRatio"] == null ? null : json["aspectRatio"].toDouble(),
        language: json["language"] == null ? null : languageValues.map[json["language"]],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "link": link == null ? null : link,
        "aspectRatio": aspectRatio == null ? null : aspectRatio,
        "language": language == null ? null : languageValues.reverse[language],
        "width": width == null ? null : width,
        "height": height == null ? null : height,
    };
}

enum Language { EN }

final languageValues = EnumValues({
    "en": Language.EN
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
