import 'package:flutter/material.dart';
import 'package:huys_ter_horst/widgets/item.dart';

class ItemScreen extends StatelessWidget {
  String code = '';
  ItemScreen(this.code);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanner',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Item(this.code),
      ),
    );
  }
}
