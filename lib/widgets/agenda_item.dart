import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:carousel_pro/carousel_pro.dart';

class AgendaItem extends StatelessWidget {
  final content = 'In het seizoen (van april t/m oktober) worden er op aanvraag' +
      'rondleidingen verzorgd mits er een rondleider beschikbaar is. Wij vragen een kleine vergoeding p.p.,' +
      'kinderen t/m 12 jaar gratis. '
      'Voor een rondleiding. Informeer op nummer 06-16969913\n\n' +
      'Voor vragen over de toegang tot en gebruik van kasteel Huys ter Horst kunt u op dit ' +
      'e-mail adres: **rondleiding@kasteelhuysterhorst.nl** terecht. ';
  final adress = 'Stichting kasteel Huys ter Horst\n' +
      'p/a Pr. Margrietstraat 24\n' +
      '5961 BL Horst\n';
  final subtitle = 'Bezoekadres';
  final title = 'Agenda';
  final images = [
    'http://kasteelhuysterhorst.nl/fotos/luchtfoto.jpg',
    'http://www.kasteelhuysterhorst.nl/fotos/DSC_0434.jpg',
    'http://kasteelhuysterhorst.nl/fotos/kasteel1.jpg'
  ];

  List<NetworkImage> _convertImages(images) {
    final networkImages = List<NetworkImage>();

    networkImages.clear();
    images.forEach((image) => networkImages.add(NetworkImage(image)));
    return networkImages;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0.0),
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
                data: adress,
              ),
              SizedBox(
                height: 10.0,
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
