import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:imdb/imdb.dart';
import 'package:social/Models/mostpopular.dart';
import 'package:social/Models/postsmodel.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:social/screen/movieinfo.dart';
import 'package:social/util.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key key}) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

Future<MostPopularModel> getTop10Series() async {
  final String baseUrl = 'https://imdb-api.com/en/API/MostPopularMovies/';
  final String apiKey = dotenv.env['apiKey'];

  var url = baseUrl + apiKey;
  var response = await http.get(url);

  // if (response.statusCode == 200) {
  //   print('load');
  //   print(response.body);
  // }

  // MostPopularModel mostPopularModel = mostPopularModelFromJson(response.body);
  Map<String, dynamic> map = json.decode(response.body);
  List<dynamic> data = map["items"];
  print(data[0]["title"]);
  // List jsonResponse = json.decode(response.body);
  MostPopularModel mostPopularModel = MostPopularModel.fromJson(map);
  return mostPopularModel;

  //return mostPopularModel;
}

class _PostsScreenState extends State<PostsScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getTop10Series();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Most Popular',
            style: title,
          ),
        ),
        ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            FutureBuilder<MostPopularModel>(
                future: getTop10Series(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //return Text(snapshot.data.items.length.toString());
                    return Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: ListView.builder(
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data.items.length -
                              snapshot.data.items.length +
                              20,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              // height: 150,
                              child: Container(
                                width: 150,
                                child: GestureDetector(
                                  onTap: () async {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return MovieInfo(
                                        id: snapshot.data.items[index].id,
                                        snapshot: snapshot,
                                        title: snapshot.data.items[index].title,
                                      );
                                    }));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          snapshot.data.items[index].image),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }
                  if (snapshot.hasError) {
                    return Container(
                        width: size.width,
                        child: Row(
                          children: [
                            Text(
                              snapshot.error.toString(),
                              style: title,
                            )
                          ],
                        ));
                  }
                  return Center(child: CircularProgressIndicator());
                })
          ],
        ),
      ],
    );
  }
}
