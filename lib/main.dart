import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Octoscan',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Octoscan', style: TextStyle(color: Colors.white)),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Kasteel Huys ter Hof',
                      style: TextStyle(color: Colors.white)),
                  decoration: BoxDecoration(
                    color: Colors.orange,
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
        ));
  }
}
