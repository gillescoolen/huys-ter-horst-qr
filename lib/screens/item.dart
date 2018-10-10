import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Scanner',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            body: _BuildItemScreen()));
  }
}

class _BuildItemScreen extends StatelessWidget {
  final itemName = 'Haydar\'s Lievelings Foto\'s ';
  final itemDescription = 'Geile beer';
  final itemText = 'Lorem ipsum dolor sit amet, consectetuer adipiscing eli';
  final itemImages = [
    'https://upload.wikimedia.org/wikipedia/commons/2/2f/Hentai_-_yuuree-redraw.jpg',
    'http://hentaihaven.org/package/2016/12/HH-Toshi-Densetsu-Series-EP-3-DVD-BE8C2E68.mp4_snapshot_05.40_2016.12.04_15.26.31.jpg',
    'http://images.jpost.com/image/upload/f_auto,fl_lossy/t_Article2016_ControlFaceDetect/417440',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
            height: 350.0,
            child: Carousel(
              images: [
                NetworkImage(itemImages[0]),
                NetworkImage(itemImages[1]),
                NetworkImage(itemImages[2]),
              ],
              boxFit: BoxFit.cover,
              autoplay: false,
              overlayShadow: false,
              dotBgColor: Colors.transparent,
            )),
        Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                itemName,
                style: TextStyle(fontSize: 32.0),
              ),
              Text(
                itemDescription,
                style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20.0,
              ),
              MarkdownBody(data: itemText),
            ],
          ),
        )
      ],
    );
  }
}
