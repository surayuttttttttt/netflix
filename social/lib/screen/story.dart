import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:social/Models/mostpopular.dart';
import 'package:social/Models/storymodel.dart';
import 'package:omdb_dart/omdb_dart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:social/screen/trailer.dart';

import '../util.dart';

class StoriesWidget extends StatefulWidget {
  const StoriesWidget({Key key}) : super(key: key);

  @override
  _StoriesWidgetState createState() => _StoriesWidgetState();
}

ScrollController scrollController = ScrollController();
Future<List<StoriesModel>> getPosts() async {
  var url = "https://jsonplaceholder.typicode.com/photos";
  var response = await http.get(Uri.parse(url));
  List jsonResponse = json.decode(response.body);
  return jsonResponse.map((post) => new StoriesModel.fromJson(post)).toList();
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

class _StoriesWidgetState extends State<StoriesWidget> {
  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Previews',
            style: title,
          ),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder<MostPopularModel>(
              future: getTop10Series(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Container(
                      width: size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Text(
                            snapshot.error.toString(),
                            style: title,
                          )
                        ],
                      ));
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                showCupertinoModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Trailers(
                                        snapshot: snapshot,
                                        id: snapshot.data.items[index].id,
                                      );
                                    });
                              },
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                      radius: (50),
                                      backgroundColor: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image(
                                              height: 93,
                                              width: 100,
                                              fit: BoxFit.fitWidth,
                                              image: NetworkImage(snapshot
                                                  .data.items[index].image)),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.data.items[index].title,
                                    style: subtitle,
                                    //overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        );

                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(600),
                        //   child: Container(
                        //       // decoration: BoxDecoration(shape: BoxShape.circle),
                        //       // height: 150,
                        //       // width: 150,
                        //       child: Image(
                        //     height: 100,
                        //     width: 100,
                        //     fit: BoxFit.fitWidth,
                        //     image:
                        //         NetworkImage(snapshot.data.items[index].image),
                        //   )),
                        // );
                      });
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ],
    );
  }
}
