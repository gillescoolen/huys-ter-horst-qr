import 'package:flutter/material.dart';
import 'widgets/scanner.dart';

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
      title: 'Octoscan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Octoscan', style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Kasteel Huys ter Hof',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                ),
              ),
              ListTile(
                title: Text('Scan History'),
                onTap: () {
                  // TODO: Add scan history page.
                },
              ),
              ListTile(
                title: Text('Events'),
                onTap: () {
                  // TODO: Add events page.
                },
              ),
            ],
          ),
        ),
        body: Scanner(),
      ),
    );
  }
}
