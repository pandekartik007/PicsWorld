import 'package:flutter/material.dart';
import 'package:pics_world/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PicsWorld',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.teal
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
