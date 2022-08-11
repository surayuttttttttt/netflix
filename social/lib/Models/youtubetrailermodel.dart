// To parse this JSON data, do
//
//     final youtubeTrailerModel = youtubeTrailerModelFromJson(jsonString);

import 'dart:convert';

YoutubeTrailerModel youtubeTrailerModelFromJson(String str) => YoutubeTrailerModel.fromJson(json.decode(str));

String youtubeTrailerModelToJson(YoutubeTrailerModel data) => json.encode(data.toJson());

class YoutubeTrailerModel {
    YoutubeTrailerModel({
        this.imDbId,
        this.title,
        this.fullTitle,
        this.type,
        this.year,
        this.videoId,
        this.videoUrl,
        this.errorMessage,
    });

    final String imDbId;
    final String title;
    final String fullTitle;
    final String type;
    final String year;
    final String videoId;
    final String videoUrl;
    final String errorMessage;

    factory YoutubeTrailerModel.fromJson(Map<String, dynamic> json) => YoutubeTrailerModel(
        imDbId: json["imDbId"] == null ? null : json["imDbId"],
        title: json["title"] == null ? null : json["title"],
        fullTitle: json["fullTitle"] == null ? null : json["fullTitle"],
        type: json["type"] == null ? null : json["type"],
        year: json["year"] == null ? null : json["year"],
        videoId: json["videoId"] == null ? null : json["videoId"],
        videoUrl: json["videoUrl"] == null ? null : json["videoUrl"],
        errorMessage: json["errorMessage"] == null ? null : json["errorMessage"],
    );

    Map<String, dynamic> toJson() => {
        "imDbId": imDbId == null ? null : imDbId,
        "title": title == null ? null : title,
        "fullTitle": fullTitle == null ? null : fullTitle,
        "type": type == null ? null : type,
        "year": year == null ? null : year,
        "videoId": videoId == null ? null : videoId,
        "videoUrl": videoUrl == null ? null : videoUrl,
        "errorMessage": errorMessage == null ? null : errorMessage,
    };
}
