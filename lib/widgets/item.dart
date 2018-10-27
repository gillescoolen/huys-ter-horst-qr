import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Item extends StatefulWidget {
  @override
  _ItemState createState() => new _ItemState();
}

class _ItemState extends State<Item> {
  DocumentSnapshot itemData;

  final networkImages = List<NetworkImage>();

  List<NetworkImage> _convertImages(images) {
    networkImages.clear();
    images.forEach((image) => networkImages.add(NetworkImage(image)));
    return networkImages;
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    final item = ItemData.fromSnapshot(itemData);

    return ListView(
      children: [
        SizedBox(
          height: 350.0,
          child: Carousel(
            images: _convertImages(item.images),
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
                item.title,
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

  Future _getData() async {
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
  final List<dynamic> images;
  final DocumentReference reference;

  ItemData.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        assert(map['subtitle'] != null),
        assert(map['content'] != null),
        assert(map['images'] != null),
        title = map['title'],
        subtitle = map['subtitle'],
        content = map['content'],
        images = map['images'];
  ItemData.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
  @override
  String toString() => "ItemData<$title:$subtitle>";
}
