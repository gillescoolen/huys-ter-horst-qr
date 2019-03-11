import 'package:huys_ter_horst/screens/home.dart';
import 'package:huys_ter_horst/widgets/scanner.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Huys ter Horst',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.orangeAccent,
        primaryColor: Colors.orange,
      ),
      home: MainPage(),
    );
  }
}
