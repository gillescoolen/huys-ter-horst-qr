import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:carousel_pro/carousel_pro.dart';

class AboutItem extends StatelessWidget {
  final content = 'Momenteel wordt de kasteelruïne geconsolideerd en gerevitaliseerd door de Stichting kasteel Huys ter Horst\n' +
      'Begin 2000 werd een initiatief genomen om de diverse stichtingen die actief zijn met het ' +
      'behoud van het cultureel erfgoed in onze gemeente samen te brengen. ' +
      'Deze stichting heeft ten doel het verzekeren van de instandhouding en het toegankelijk maken voor' +
      'een zo breed mogelijk publiek van het culturele erfgoed van de gemeente, te weten: de kasteelruïne en' +
      'alle andere behoudenswaardige onroerende goederen.\n'
      '\nHet eerste project dat door deze stichting opgepakt werd is de kasteelruïne. Hiertoe werd aan drs.' +
      'M. Purmer (historisch-geograaf) de opdracht verstrekt om de historisch-geografische omgeving van de ruïne te schetsen en de mogelijkheden voor de toekomst aan te geven.' +
      'Nadat Drs. M Purmer zijn onderzoek afrondde met de notitie “De ruïne van Horst: een verkenning”,' +
      'publiceerde de stichting in september 2001 in de nota “Huis ter Horst, een toekomst voor een ruïne” haar ' +
      'visie op de invulling van de gewenste en noodzakelijke werkzaamheden aan de ruïne en het omliggende gebied.' +
      'De eerste stappen werden gezet, hierna werd begonnen met de uitvoering van de plannen.\n';
  final adress = 'Stichting kasteel Huys ter Horst\n' +
      'p/a Pr. Margrietstraat 24\n' +
      '5961 BL Horst\n';
  final subtitle = 'Adres';
  final title = 'Stichting Kasteel Huys Ter Horst';
  final images = [
    'http://www.kasteelhuysterhorst.nl/fotos/DSC_0434.jpg',
    'http://kasteelhuysterhorst.nl/fotos/luchtfoto.jpg',
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
