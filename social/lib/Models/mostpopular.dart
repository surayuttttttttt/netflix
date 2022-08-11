// To parse this JSON data, do
//
//     final mostPopularModel = mostPopularModelFromJson(jsonString);

import 'dart:convert';

MostPopularModel mostPopularModelFromJson(String str) =>
    MostPopularModel.fromJson(json.decode(str));

String mostPopularModelToJson(MostPopularModel data) =>
    json.encode(data.toJson());

class MostPopularModel {
  MostPopularModel({
    this.items,
    this.errorMessage,
  });

  final List<Item> items;
  final String errorMessage;

  factory MostPopularModel.fromJson(Map<String, dynamic> json) =>
      MostPopularModel(
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        errorMessage:
            json["errorMessage"] == null ? null : json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
        "errorMessage": errorMessage == null ? null : errorMessage,
      };
}

class Item {
  Item({
    this.id,
    this.rank,
    this.rankUpDown,
    this.title,
    this.fullTitle,
    this.year,
    this.image,
    this.crew,
    this.imDbRating,
    this.imDbRatingCount,
  });

  final String id;
  final String rank;
  final String rankUpDown;
  final String title;
  final String fullTitle;
  final String year;
  final String image;
  final String crew;
  final String imDbRating;
  final String imDbRatingCount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] == null ? null : json["id"],
        rank: json["rank"] == null ? null : json["rank"],
        rankUpDown: json["rankUpDown"] == null ? null : json["rankUpDown"],
        title: json["title"] == null ? null : json["title"],
        fullTitle: json["fullTitle"] == null ? null : json["fullTitle"],
        year: json["year"] == null ? null : json["year"],
        image: json["image"] == null ? null : json["image"],
        crew: json["crew"] == null ? null : json["crew"],
        imDbRating: json["imDbRating"] == null ? null : json["imDbRating"],
        imDbRatingCount:
            json["imDbRatingCount"] == null ? null : json["imDbRatingCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "rank": rank == null ? null : rank,
        "rankUpDown": rankUpDown == null ? null : rankUpDown,
        "title": title == null ? null : title,
        "fullTitle": fullTitle == null ? null : fullTitle,
        "year": year == null ? null : year,
        "image": image == null ? null : image,
        "crew": crew == null ? null : crew,
        "imDbRating": imDbRating == null ? null : imDbRating,
        "imDbRatingCount": imDbRatingCount == null ? null : imDbRatingCount,
      };
}
