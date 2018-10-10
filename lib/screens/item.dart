import 'package:flutter/material.dart';
import 'package:octoscan/widgets/item.dart';

class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Item(),
    );
  }
}
