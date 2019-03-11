import 'package:flutter/material.dart';
import 'package:huys_ter_horst/screens/news.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kasteel Huys ter Horst',
            style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: News(),
    );
  }
}
