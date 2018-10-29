import 'package:flutter/material.dart';
import 'package:huys_ter_horst/screens/error.dart';
import 'package:huys_ter_horst/widgets/drawer_item.dart';
import 'package:huys_ter_horst/widgets/scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:huys_ter_horst/screens/about.dart';
import 'package:huys_ter_horst/screens/Agenda.dart';
import 'package:huys_ter_horst/screens/history.dart';

class MainPage extends StatefulWidget {
  final drawerItems = [
    DrawerItem("Scanner", Icons.camera_alt),
    DrawerItem("Agenda", Icons.view_agenda),
    DrawerItem("Geschiedenis", Icons.history),
    DrawerItem("Over Ons", Icons.business),
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
      case 1:
        return Agenda();
      case 2:
        return History();
      case 3:
        return About();
      default:
        return ErrorScreen();
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'lib/assets/icon.svg',
                    height: 100.0,
                    width: 100.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Welcome to Huys Castle',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
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
