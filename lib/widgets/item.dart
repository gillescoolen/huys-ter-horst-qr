import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Item extends StatefulWidget {
  @override
  _ItemState createState() => new _ItemState();
}

class _ItemState extends State<Item> {
  final title = 'Gilles en Matthijs';
  final subtitle = 'Jullie vriendinnen';
  final content = 'Lekkere geile fotos voor ons';
  final images = [
    'https://www.famousbirthdays.com/faces/granny-image.jpg',
    'http://www.hun.is/wp-content/uploads/2013/08/old-lady.jpg',
  ];

  final networkImages = List<NetworkImage>();

  List<NetworkImage> convertImages() {
    networkImages.clear();
    images.forEach((image) => networkImages.add(NetworkImage(image)));
    return networkImages;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 350.0,
          child: Carousel(
            images: convertImages(),
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
    );
  }
}
