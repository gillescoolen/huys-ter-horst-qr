import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Item extends StatefulWidget {
  @override
  _ItemState createState() => new _ItemState();
}

class _ItemState extends State<Item> {
  final title = 'Haydar\'s Lievelings Foto\'s ';
  final subtitle = 'Geile beer';
  final content = 'Lorem ipsum dolor sit amet, consectetuer adipiscing eli';
  final images = [
    'https://myanimelist.cdn-dena.com/images/characters/3/361761.jpg',
    'https://myanimelist.cdn-dena.com/images/characters/15/316061.jpg',
    'https://myanimelist.cdn-dena.com/images/characters/14/284324.jpg',
  ];
  final networkImages = List<NetworkImage>();

  List<NetworkImage> convertImages() {
    images.forEach((image) => networkImages.add(NetworkImage(image)));
    return networkImages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 350.0,
            child: Carousel(
              images: convertImages(),
              boxFit: BoxFit.cover,
              autoplay: false,
              overlayShadow: false,
              dotBgColor: Colors.transparent,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 32.0),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20.0,
                ),
                MarkdownBody(
                  data: content,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
