import 'package:facebook_ui_mockup/config/paletter.dart';
import 'package:facebook_ui_mockup/screens/home_screen.dart';
import 'package:facebook_ui_mockup/screens/nav_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Palette.scaffold,
        primarySwatch: Colors.blue,
      ),
      home: NavScreen(),
    );
  }
}
