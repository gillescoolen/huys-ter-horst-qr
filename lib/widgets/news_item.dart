import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_pro/carousel_pro.dart';

class NewsItem extends StatelessWidget {
  String title;
  String subtitle;
  String content;
  List<dynamic> images = [];
  DateTime date;

  NewsItem(this.title, this.subtitle, this.content, this.images, this.date);

  List<NetworkImage> _convertImages(images) {
    final networkImages = List<NetworkImage>();

    if (images != null) {
      networkImages.clear();
      images.forEach((image) => networkImages.add(NetworkImage(image)));
      return networkImages;
    }
    return networkImages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 350.0,
            child: Carousel(
              images: _convertImages(images),
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
                  height: 10.0,
                ),
                MarkdownBody(
                  data: content,
                  onTapLink: _onTapLink,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onTapLink(String href) {
    launch(href);
  }
}
