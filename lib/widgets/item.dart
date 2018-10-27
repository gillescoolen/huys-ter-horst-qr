import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Item extends StatefulWidget {
  @override
  _ItemState createState() => new _ItemState();
}

class _ItemState extends State<Item> {
  final title = 'Haydar P.';
  final subtitle = 'Bang voor 2D meisjes';
  final content = 'test';
  final images = [
    'https://vignette.wikia.nocookie.net/typemoon/images/7/7a/RinUCopening.jpg/revision/latest/scale-to-width-down/300?cb=20141020220532',
    'https://static.zerochan.net/Tohsaka.Rin.full.2060968.jpg',
    'https://i.kym-cdn.com/photos/images/original/001/308/649/d53.png',
  ];

  DocumentSnapshot itemData;

  final networkImages = List<NetworkImage>();

  List<NetworkImage> _convertImages() {
    networkImages.clear();
    images.forEach((image) => networkImages.add(NetworkImage(image)));
    return networkImages;
  }

  @override
  initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    item();
    return Text(itemData['title'].toString());
  }

  Widget yeeter(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 350.0,
          child: Carousel(
            images: _convertImages(),
            boxFit: BoxFit.cover,
            autoplay: false,
            overlayShadow: false,
            dotBgColor: Colors.transparent,
            dotSize: 6.0,
          ),
        ),
        Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'yeet',
                style: TextStyle(fontSize: 32.0),
              ),
              Text(
                'yaaaaayeeeeet',
                style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20.0,
              ),
              MarkdownBody(
                data: 'content',
              ),
            ],
          ),
        )
      ],
    );
  }

  Future item() async {
    try {
      DocumentSnapshot itemData = await Firestore.instance
          .collection('items')
          .document('AgO44JyheBo02nexRRI4')
          .get();
      setState(() {
        this.itemData = itemData;
      });
      print(itemData.documentID);
    } catch (e) {
      print(e);
    }
  }
}

class ItemData {
  final String title;
  final String subtitle;
  final String content;
  final DocumentReference reference;

  ItemData.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        assert(map['subtitle'] != null),
        assert(map['content'] != null),
        assert(map['subtitle'] != null),
        title = map['title'],
        content = map['content'],
        subtitle = map['subtitle'];
  ItemData.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "ItemData<$title:$subtitle>";
}
