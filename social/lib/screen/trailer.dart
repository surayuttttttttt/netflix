import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:social/Models/info.dart';
import 'package:social/Models/mostpopular.dart';
import 'package:social/Models/youtubetrailermodel.dart';
import 'package:http/http.dart' as http;

class Trailers extends StatefulWidget {
  const Trailers({Key key, this.snapshot, this.id}) : super(key: key);
  final AsyncSnapshot<MostPopularModel> snapshot;
  final String id;

  @override
  _TrailersState createState() => _TrailersState();
}

class _TrailersState extends State<Trailers> {
  Future<YoutubeTrailerModel> gettrailer() async {
    final String baseUrl = 'https://imdb-api.com/en/API/YouTubeTrailer/';
    final String apiKey = dotenv.env['apiKey'];
    var url = baseUrl + apiKey + "/" + widget.id;
    var response = await http.get(url);
    Map<String, dynamic> map = json.decode(response.body);
    YoutubeTrailerModel youtubeTrailerModel = YoutubeTrailerModel.fromJson(map);

    return youtubeTrailerModel;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 1.75,
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: FutureBuilder<YoutubeTrailerModel>(
            future: gettrailer(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                var myVideoId = snapshot.data.videoId;
                
                return Center(
                  child: Text(snapshot.data.title),
                );
              }
              return Container();
            }),
      ),
    );
  }
}
