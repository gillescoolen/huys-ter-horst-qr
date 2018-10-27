import 'package:flutter/material.dart';
import 'package:huys_ter_horst/widgets/history_item.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanner',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context),
      home: Scaffold(
        body: HistoryItem(),
      ),
    );
  }
}
