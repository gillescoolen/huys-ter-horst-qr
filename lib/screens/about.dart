import 'package:flutter/material.dart';
import 'package:huys_ter_horst/widgets/about_item.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanner',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context),
      home: Scaffold(
        body: AboutItem(),
      ),
    );
  }
}
