// To parse this JSON data, do
//
//     final infoModel = infoModelFromJson(jsonString);

import 'dart:convert';

InfoModel infoModelFromJson(String str) => InfoModel.fromJson(json.decode(str));

String infoModelToJson(InfoModel data) => json.encode(data.toJson());

class InfoModel {
    InfoModel({
        this.id,
        this.title,
        this.originalTitle,
        this.fullTitle,
        this.type,
        this.year,
        this.image,
        this.releaseDate,
        this.runtimeMins,
        this.runtimeStr,
        this.plot,
        this.plotLocal,
        this.plotLocalIsRtl,
        this.awards,
        this.directors,
        this.directorList,
        this.writers,
        this.writerList,
        this.stars,
        this.starList,
        this.actorList,
        this.fullCast,
        this.genres,
        this.genreList,
        this.companies,
        this.companyList,
        this.countries,
        this.countryList,
        this.languages,
        this.languageList,
        this.contentRating,
        this.imDbRating,
        this.imDbRatingVotes,
        this.metacriticRating,
        this.ratings,
        this.wikipedia,
        this.posters,
        this.images,
        this.trailer,
        this.boxOffice,
        this.tagline,
        this.keywords,
        this.keywordList,
        this.similars,
        this.tvSeriesInfo,
        this.tvEpisodeInfo,
        this.errorMessage,
    });

    final String id;
    final String title;
    final String originalTitle;
    final String fullTitle;
    final String type;
    final String year;
    final String image;
    final DateTime releaseDate;
    final String runtimeMins;
    final String runtimeStr;
    final String plot;
    final String plotLocal;
    final bool plotLocalIsRtl;
    final String awards;
    final String directors;
    final List<CompanyListElement> directorList;
    final String writers;
    final List<CompanyListElement> writerList;
    final String stars;
    final List<CompanyListElement> starList;
    final List<ActorList> actorList;
    final dynamic fullCast;
    final String genres;
    final List<CountryListElement> genreList;
    final String companies;
    final List<CompanyListElement> companyList;
    final String countries;
    final List<CountryListElement> countryList;
    final String languages;
    final List<CountryListElement> languageList;
    final String contentRating;
    final String imDbRating;
    final String imDbRatingVotes;
    final String metacriticRating;
    final dynamic ratings;
    final dynamic wikipedia;
    final dynamic posters;
    final dynamic images;
    final dynamic trailer;
    final BoxOffice boxOffice;
    final dynamic tagline;
    final String keywords;
    final List<String> keywordList;
    final List<Similar> similars;
    final dynamic tvSeriesInfo;
    final dynamic tvEpisodeInfo;
    final dynamic errorMessage;

    factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        originalTitle: json["originalTitle"] == null ? null : json["originalTitle"],
        fullTitle: json["fullTitle"] == null ? null : json["fullTitle"],
        type: json["type"] == null ? null : json["type"],
        year: json["year"] == null ? null : json["year"],
        image: json["image"] == null ? null : json["image"],
        releaseDate: json["releaseDate"] == null ? null : DateTime.parse(json["releaseDate"]),
        runtimeMins: json["runtimeMins"] == null ? null : json["runtimeMins"],
        runtimeStr: json["runtimeStr"] == null ? null : json["runtimeStr"],
        plot: json["plot"] == null ? null : json["plot"],
        plotLocal: json["plotLocal"] == null ? null : json["plotLocal"],
        plotLocalIsRtl: json["plotLocalIsRtl"] == null ? null : json["plotLocalIsRtl"],
        awards: json["awards"] == null ? null : json["awards"],
        directors: json["directors"] == null ? null : json["directors"],
        directorList: json["directorList"] == null ? null : List<CompanyListElement>.from(json["directorList"].map((x) => CompanyListElement.fromJson(x))),
        writers: json["writers"] == null ? null : json["writers"],
        writerList: json["writerList"] == null ? null : List<CompanyListElement>.from(json["writerList"].map((x) => CompanyListElement.fromJson(x))),
        stars: json["stars"] == null ? null : json["stars"],
        starList: json["starList"] == null ? null : List<CompanyListElement>.from(json["starList"].map((x) => CompanyListElement.fromJson(x))),
        actorList: json["actorList"] == null ? null : List<ActorList>.from(json["actorList"].map((x) => ActorList.fromJson(x))),
        fullCast: json["fullCast"],
        genres: json["genres"] == null ? null : json["genres"],
        genreList: json["genreList"] == null ? null : List<CountryListElement>.from(json["genreList"].map((x) => CountryListElement.fromJson(x))),
        companies: json["companies"] == null ? null : json["companies"],
        companyList: json["companyList"] == null ? null : List<CompanyListElement>.from(json["companyList"].map((x) => CompanyListElement.fromJson(x))),
        countries: json["countries"] == null ? null : json["countries"],
        countryList: json["countryList"] == null ? null : List<CountryListElement>.from(json["countryList"].map((x) => CountryListElement.fromJson(x))),
        languages: json["languages"] == null ? null : json["languages"],
        languageList: json["languageList"] == null ? null : List<CountryListElement>.from(json["languageList"].map((x) => CountryListElement.fromJson(x))),
        contentRating: json["contentRating"] == null ? null : json["contentRating"],
        imDbRating: json["imDbRating"] == null ? null : json["imDbRating"],
        imDbRatingVotes: json["imDbRatingVotes"] == null ? null : json["imDbRatingVotes"],
        metacriticRating: json["metacriticRating"] == null ? null : json["metacriticRating"],
        ratings: json["ratings"],
        wikipedia: json["wikipedia"],
        posters: json["posters"],
        images: json["images"],
        trailer: json["trailer"],
        boxOffice: json["boxOffice"] == null ? null : BoxOffice.fromJson(json["boxOffice"]),
        tagline: json["tagline"],
        keywords: json["keywords"] == null ? null : json["keywords"],
        keywordList: json["keywordList"] == null ? null : List<String>.from(json["keywordList"].map((x) => x)),
        similars: json["similars"] == null ? null : List<Similar>.from(json["similars"].map((x) => Similar.fromJson(x))),
        tvSeriesInfo: json["tvSeriesInfo"],
        tvEpisodeInfo: json["tvEpisodeInfo"],
        errorMessage: json["errorMessage"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "originalTitle": originalTitle == null ? null : originalTitle,
        "fullTitle": fullTitle == null ? null : fullTitle,
        "type": type == null ? null : type,
        "year": year == null ? null : year,
        "image": image == null ? null : image,
        "releaseDate": releaseDate == null ? null : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "runtimeMins": runtimeMins == null ? null : runtimeMins,
        "runtimeStr": runtimeStr == null ? null : runtimeStr,
        "plot": plot == null ? null : plot,
        "plotLocal": plotLocal == null ? null : plotLocal,
        "plotLocalIsRtl": plotLocalIsRtl == null ? null : plotLocalIsRtl,
        "awards": awards == null ? null : awards,
        "directors": directors == null ? null : directors,
        "directorList": directorList == null ? null : List<dynamic>.from(directorList.map((x) => x.toJson())),
        "writers": writers == null ? null : writers,
        "writerList": writerList == null ? null : List<dynamic>.from(writerList.map((x) => x.toJson())),
        "stars": stars == null ? null : stars,
        "starList": starList == null ? null : List<dynamic>.from(starList.map((x) => x.toJson())),
        "actorList": actorList == null ? null : List<dynamic>.from(actorList.map((x) => x.toJson())),
        "fullCast": fullCast,
        "genres": genres == null ? null : genres,
        "genreList": genreList == null ? null : List<dynamic>.from(genreList.map((x) => x.toJson())),
        "companies": companies == null ? null : companies,
        "companyList": companyList == null ? null : List<dynamic>.from(companyList.map((x) => x.toJson())),
        "countries": countries == null ? null : countries,
        "countryList": countryList == null ? null : List<dynamic>.from(countryList.map((x) => x.toJson())),
        "languages": languages == null ? null : languages,
        "languageList": languageList == null ? null : List<dynamic>.from(languageList.map((x) => x.toJson())),
        "contentRating": contentRating == null ? null : contentRating,
        "imDbRating": imDbRating == null ? null : imDbRating,
        "imDbRatingVotes": imDbRatingVotes == null ? null : imDbRatingVotes,
        "metacriticRating": metacriticRating == null ? null : metacriticRating,
        "ratings": ratings,
        "wikipedia": wikipedia,
        "posters": posters,
        "images": images,
        "trailer": trailer,
        "boxOffice": boxOffice == null ? null : boxOffice.toJson(),
        "tagline": tagline,
        "keywords": keywords == null ? null : keywords,
        "keywordList": keywordList == null ? null : List<dynamic>.from(keywordList.map((x) => x)),
        "similars": similars == null ? null : List<dynamic>.from(similars.map((x) => x.toJson())),
        "tvSeriesInfo": tvSeriesInfo,
        "tvEpisodeInfo": tvEpisodeInfo,
        "errorMessage": errorMessage,
    };
}

class ActorList {
    ActorList({
        this.id,
        this.image,
        this.name,
        this.asCharacter,
    });

    final String id;
    final String image;
    final String name;
    final String asCharacter;

    factory ActorList.fromJson(Map<String, dynamic> json) => ActorList(
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : json["image"],
        name: json["name"] == null ? null : json["name"],
        asCharacter: json["asCharacter"] == null ? null : json["asCharacter"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "image": image == null ? null : image,
        "name": name == null ? null : name,
        "asCharacter": asCharacter == null ? null : asCharacter,
    };
}

class BoxOffice {
    BoxOffice({
        this.budget,
        this.openingWeekendUsa,
        this.grossUsa,
        this.cumulativeWorldwideGross,
    });

    final String budget;
    final String openingWeekendUsa;
    final String grossUsa;
    final String cumulativeWorldwideGross;

    factory BoxOffice.fromJson(Map<String, dynamic> json) => BoxOffice(
        budget: json["budget"] == null ? null : json["budget"],
        openingWeekendUsa: json["openingWeekendUSA"] == null ? null : json["openingWeekendUSA"],
        grossUsa: json["grossUSA"] == null ? null : json["grossUSA"],
        cumulativeWorldwideGross: json["cumulativeWorldwideGross"] == null ? null : json["cumulativeWorldwideGross"],
    );

    Map<String, dynamic> toJson() => {
        "budget": budget == null ? null : budget,
        "openingWeekendUSA": openingWeekendUsa == null ? null : openingWeekendUsa,
        "grossUSA": grossUsa == null ? null : grossUsa,
        "cumulativeWorldwideGross": cumulativeWorldwideGross == null ? null : cumulativeWorldwideGross,
    };
}

class CompanyListElement {
    CompanyListElement({
        this.id,
        this.name,
    });

    final String id;
    final String name;

    factory CompanyListElement.fromJson(Map<String, dynamic> json) => CompanyListElement(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
    };
}

class CountryListElement {
    CountryListElement({
        this.key,
        this.value,
    });

    final String key;
    final String value;

    factory CountryListElement.fromJson(Map<String, dynamic> json) => CountryListElement(
        key: json["key"] == null ? null : json["key"],
        value: json["value"] == null ? null : json["value"],
    );

    Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "value": value == null ? null : value,
    };
}

class Similar {
    Similar({
        this.id,
        this.title,
        this.image,
        this.imDbRating,
    });

    final String id;
    final String title;
    final String image;
    final String imDbRating;

    factory Similar.fromJson(Map<String, dynamic> json) => Similar(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
        imDbRating: json["imDbRating"] == null ? null : json["imDbRating"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "imDbRating": imDbRating == null ? null : imDbRating,
    };
}
