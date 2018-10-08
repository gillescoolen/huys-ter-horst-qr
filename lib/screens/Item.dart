import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

void main() => runApp(ItemScreen());

class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
            appBar: AppBar(
              leading:
                  IconButton(icon: Icon(Icons.arrow_back), onPressed: () => {}),
            ),
            body: _BuildItemScreen()));
  }
}

class _BuildItemScreen extends StatelessWidget {
  final itemName = 'Paiting Name';
  final itemDescription = 'P. Ainter';
  final itemText = 'Lorem ipsum dolor sit amet, consectetuer adipiscing eli';
  final itemImages = [
    'https://i0.wp.com/www.scientias.nl/wp-content/uploads/2018/09/804px-Mona_Lisa_by_Leonardo_da_Vinci_from_C2RMF_retouched.jpg?resize=750%2C1118&ssl=1',
    'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'
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
                NetworkImage(itemImages[1])
              ],
              boxFit: BoxFit.cover,
              autoplay: false,
              overlayShadow: false,
              dotBgColor: Colors.transparent,
            )),
        Container(
          padding:
              EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
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
              Text(itemText),
            ],
          ),
        )
      ],
    );
  }
}
