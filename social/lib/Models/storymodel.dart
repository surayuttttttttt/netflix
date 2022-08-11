// To parse this JSON data, do
//
//     final storiesModel = storiesModelFromJson(jsonString);

import 'dart:convert';

List<StoriesModel> storiesModelFromJson(String str) => List<StoriesModel>.from(json.decode(str).map((x) => StoriesModel.fromJson(x)));

String storiesModelToJson(List<StoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoriesModel {
    StoriesModel({
        this.albumId,
        this.id,
        this.title,
        this.url,
        this.thumbnailUrl,
    });

    final int albumId;
    final int id;
    final String title;
    final String url;
    final String thumbnailUrl;

    factory StoriesModel.fromJson(Map<String, dynamic> json) => StoriesModel(
        albumId: json["albumId"] == null ? null : json["albumId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        url: json["url"] == null ? null : json["url"],
        thumbnailUrl: json["thumbnailUrl"] == null ? null : json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId == null ? null : albumId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "url": url == null ? null : url,
        "thumbnailUrl": thumbnailUrl == null ? null : thumbnailUrl,
    };
}
