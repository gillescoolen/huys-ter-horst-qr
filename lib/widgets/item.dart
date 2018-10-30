import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:huys_ter_horst/screens/error.dart';

class Item extends StatefulWidget {
  String code = '';

  Item(this.code);

  @override
  _ItemState createState() => new _ItemState(this.code);
}

class _ItemState extends State<Item> {
  DocumentSnapshot itemData;
  var bool;
  String code = "";

  _ItemState(this.code);

  //final networkImages = List<NetworkImage>();

  List<NetworkImage> _convertImages(images) {
    final networkImages = List<NetworkImage>();

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
    if (itemData == null)
      return Center(
        child: CircularProgressIndicator(),
      );

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
                item.subtitle,
                style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10.0,
              ),
              MarkdownBody(
                data: item.content,
              ),
            ],
          ),
        )
      ],
    );
  }

  Future _getData() async {
    try {
      Future.doWhile(bool);
      DocumentSnapshot itemData = await Firestore.instance
          .collection('items')
          .document(this.code)
          .get();
      if (itemData.exists) {
        setState(() {
          this.itemData = itemData;
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ErrorScreen()),
        );
        bool = false;
      }
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
}
