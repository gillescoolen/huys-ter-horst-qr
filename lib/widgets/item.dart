import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:huys_ter_horst/data/item.dart';
import 'package:url_launcher/url_launcher.dart';

class Item extends StatefulWidget {
  final String code;
  Item(this.code);
  @override
  _ItemState createState() => new _ItemState(this.code);
}

class _ItemState extends State<Item> {
  final String code;
  ItemData item;
  _ItemState(this.code);

  List<NetworkImage> _convertImages(images) {
    final networkImages = List<NetworkImage>();
    networkImages.clear();
    images.forEach((image) => networkImages.add(NetworkImage(image)));
    return networkImages;
  }

  @override
  void initState() {
    super.initState();

    getData(code).then((data) {
      setState(() {
        item = data;
      });
    });
  }

  void _onTapLink(String href) {
    launch(href);
  }

  Future<ItemData> getData(String code) async {
    DocumentSnapshot item =
        await Firestore.instance.collection('items').document(code).get();
    return ItemData.fromSnapshot(item);
  }

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (item.images == null) {
      return ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(fontSize: 24.0),
                ),
                Text(
                  item.subtitle,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10.0,
                ),
                MarkdownBody(
                  data: item.content,
                  onTapLink: _onTapLink,
                ),
              ],
            ),
          )
        ],
      );
    } else {
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
              animationCurve: Curves.easeIn,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(fontSize: 24.0),
                ),
                Text(
                  item.subtitle,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10.0,
                ),
                MarkdownBody(
                  data: item.content,
                  onTapLink: _onTapLink,
                ),
              ],
            ),
          )
        ],
      );
    }
  }
}
