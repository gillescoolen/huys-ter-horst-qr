import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Octoscan',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new Scaffold(appBar: AppBar(title: Text('Octoscan'))),
    );
  }
}
