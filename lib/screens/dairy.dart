import 'package:flutter/material.dart';
import 'package:huys_ter_horst/widgets/dairy_item.dart';

class Dairy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanner',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context),
      home: Scaffold(
        body: DairyItem(),
      ),
    );
  }
}
