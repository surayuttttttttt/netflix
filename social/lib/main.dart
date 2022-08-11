import 'package:flutter/material.dart';
import 'package:social/Homepages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:social/screen/movieinfo.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePages(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new HomePages(),
        '/info': (BuildContext context) => new MovieInfo(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
