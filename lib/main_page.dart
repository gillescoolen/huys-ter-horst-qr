import 'package:flutter/material.dart';
import 'package:octoscan/widgets/drawer_item.dart';
import 'package:octoscan/screens/scanner.dart';

// TODO place this file in the appropriate folder
// I don't know where I should place this page yet.
// - Matthijs Kropholler. 4-10-2018 13:17

class MainPage extends StatefulWidget {
  final drawerItems = [
    DrawerItem("Scanner", Icons.camera),
    DrawerItem("Scan History", Icons.history),
    DrawerItem("Events", Icons.event)
  ];

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedDrawerIndex = 0;

  @override
  initState() {
    super.initState();
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return Scanner();
      default:
        return Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = <Widget>[];

    for (int i = 0; i < widget.drawerItems.length; i++) {
      DrawerItem d = widget.drawerItems[i];

      drawerOptions.add(ListTile(
        leading: Icon(d.icon),
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drawerItems[_selectedDrawerIndex].title,
            style: TextStyle(color: Colors.white)),
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
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
