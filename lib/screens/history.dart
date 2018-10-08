import 'package:flutter/material.dart';
import 'package:octoscan/widgets/history_item.dart';

import 'dart:math';

String _randomString(int length) {
  var rand = new Random();
  var codeUnits = new List.generate(
      length,
          (index){
        return rand.nextInt(33)+89;
      }
  );

  return new String.fromCharCodes(codeUnits);
}


class History extends StatelessWidget {
  List<HistoryItem> historyItems = new List<HistoryItem>();

  _readHistoryFromCache() {
    var testStrings = List<String>();
    for (int i = 0; i < 50; i++) {
      testStrings.add(_randomString(20));
    }
    return testStrings;
  }

  _buildList() {
    List<String> textList = _readHistoryFromCache();

    for (var text in textList) {
      historyItems.add(HistoryItem(text));
    }
  }

  @override
  Widget build(BuildContext context) {
    _readHistoryFromCache();

    _buildList();

    return ListView.builder(
      itemCount: historyItems.length,
      itemBuilder: (context, index) {
        final item = historyItems[index];
        return ListTile(
            title: Text(item.title),
            trailing: new Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Text("Not implemented yet!")),
              );
            });
      },
    );
  }
}
