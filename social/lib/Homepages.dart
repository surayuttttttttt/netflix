import 'package:flutter/material.dart';
import 'package:social/screen/posts.dart';
import 'package:social/screen/story.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:social/widgets/search.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key key}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  bool issearch = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                  Image(
                      image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Netflix-new-icon.png/768px-Netflix-new-icon.png')),
                  GestureDetector(
                      onTap: () async {
                        showCupertinoModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return SearchWidget();
                            });
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          PostsScreen(),
          StoriesWidget(),
          GridView.count(
            padding: EdgeInsets.all(20),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: 3,
            physics:
                NeverScrollableScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true, // You won't see infinite size error
            children: <Widget>[
              Container(
                height: 24,
                color: Colors.green,
              ),
              Container(
                height: 24,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
