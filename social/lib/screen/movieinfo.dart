import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:social/Models/info.dart';
import 'package:social/Models/poster.dart';
import 'package:social/Models/youtubetrailermodel.dart';
import 'package:social/util.dart';

import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieInfo extends StatefulWidget {
  const MovieInfo({Key key, this.title, this.image, this.snapshot, this.id})
      : super(key: key);
  final title;
  final image;
  final AsyncSnapshot snapshot;
  final id;

  @override
  _MovieInfoState createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  @override
  void initState() {
    super.initState();
  }

  Future<InfoModel> getinfo() async {
    final String baseUrl = 'https://imdb-api.com/en/API/Title/';
    final String apiKey = dotenv.env['apiKey'];
    var url = baseUrl + apiKey + "/" + widget.id;
    var response = await http.get(url);
    Map<String, dynamic> map = json.decode(response.body);
    // List<dynamic> data = map["items"];
    // print(data[0]["title"]);
    // List jsonResponse = json.decode(response.body);
    InfoModel infoModel = InfoModel.fromJson(map);
    return infoModel;

    //return mostPopularModel;
  }

  Future<YoutubeTrailerModel> gettrailer() async {
    final String baseUrl = 'https://imdb-api.com/en/API/YouTubeTrailer/';
    final String apiKey = dotenv.env['apiKey'];
    var url = baseUrl + apiKey + "/" + widget.id;
    var response = await http.get(url);
    Map<String, dynamic> map = json.decode(response.body);
    YoutubeTrailerModel youtubeTrailerModel = YoutubeTrailerModel.fromJson(map);

    return youtubeTrailerModel;
  }

  Future<PosterModel> getposter(id) async {
    final String baseUrl = 'https://imdb-api.com/API/Posters/';
    final String apiKey = dotenv.env['apiKey'];
    var url = baseUrl + apiKey + "/" + id;
    var response = await http.get(url);
    Map<String, dynamic> map = json.decode(response.body);
    PosterModel youtubeTrailerModel = PosterModel.fromJson(map);

    return youtubeTrailerModel;
  }

  String myVideoId;
  ScrollController _scrollController = ScrollController();
  AsyncSnapshot<YoutubeTrailerModel> arr1;
  AsyncSnapshot<InfoModel> arr2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 60),
        child: Container(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        //   Navigator.of(context).pushNamed('/home');
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  Text(
                    widget.title ?? 'title',
                    style: title,
                  ),
                  Icon(Icons.search)
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        controller: _scrollController,
        children: [
          FutureBuilder<YoutubeTrailerModel>(
            future: gettrailer(),
            builder: (context, trailer) {
              if (trailer.hasData) {
                myVideoId = trailer.data.videoId;
                arr1 = trailer;
                return Text(
                  trailer.data.imDbId ?? "",
                  style: title,
                );
              }
              if (trailer.hasError) {
                return Container();
              }
              return Container();
            },
          ),
          FutureBuilder<InfoModel>(
            future: getinfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                arr2 = snapshot;
                final YoutubePlayerController _controller =
                    YoutubePlayerController(
                  initialVideoId: myVideoId,
                  flags: const YoutubePlayerFlags(
                      autoPlay: false, mute: false, enableCaption: true),
                );
                return ListView(
                  shrinkWrap: true,
                  controller: _scrollController,
                  children: [
                    myVideoId != null
                        ? Padding(
                            padding: const EdgeInsets.all(.0),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: YoutubePlayer(
                                controller: _controller,
                                liveUIColor: Colors.amber,
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 300,
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(snapshot.data.image),
                              ),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            snapshot.data.imDbRating ?? "",
                            style: subtitle,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data.fullTitle ?? "",
                            style: title,
                          ),
                          Text(
                            'Genre : ' + snapshot.data.genres ?? "",
                            style: subtitle,
                          ),
                          Text(
                            'Length : ' + snapshot.data.runtimeStr ?? "",
                            style: subtitle,
                          ),
                          Text(
                            'Director : ' + snapshot.data.directors ?? "",
                            style: subtitle,
                          ),
                          Text(
                            'Star : ' + snapshot.data.stars ?? "",
                            style: subtitle,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              snapshot.data.plot ?? "",
                              style: subtitleitalic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Similar',
                        style: title,
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 400,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data.similars.length,
                          itemBuilder: (context, index) {
                            return Container(
                                height: 200,
                                child: FutureBuilder<PosterModel>(
                                    future: getposter(
                                        snapshot.data.similars[index].id),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<PosterModel> poster) {
                                      if (poster.hasData) {
                                        poster.data.posters
                                            .removeWhere((e) => e.link.isEmpty);
                                        return Container(
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount:
                                                  snapshot.data.similars.length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    MovieInfo(
                                                                      id: snapshot
                                                                          .data
                                                                          .similars[
                                                                              index]
                                                                          .id,
                                                                      title: snapshot
                                                                          .data
                                                                          .similars[
                                                                              index]
                                                                          .title,
                                                                      snapshot:
                                                                          snapshot,
                                                                    )));
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 200,
                                                        width: 150,
                                                        child: Card(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child:
                                                              CachedNetworkImage(
                                                            fit: BoxFit.fill,
                                                            imageUrl: snapshot
                                                                .data
                                                                .similars[index]
                                                                .image,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshot
                                                            .data
                                                            .similars[index]
                                                            .title,
                                                        style: subtitle,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                        );
                                      }
                                      if (poster.hasError) {
                                        return Container();
                                      }
                                      return Container();
                                    }));
                          }),
                    ),
                  ],
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error',
                    style: title,
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
