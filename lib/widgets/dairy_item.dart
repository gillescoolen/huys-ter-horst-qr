import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class DairyItem extends StatelessWidget {
  final content = 'In het seizoen (van april t/m oktober) worden er op aanvraag' +
      'rondleidingen verzorgd mits er een rondleider beschikbaar is. Wij vragen een kleine vergoeding p.p.,' +
      'kinderen t/m 12 jaar gratis. '
      'Voor een rondleiding. Informeer op nummer 06-16969913\n\n' +
      'Voor vragen over de toegang tot en gebruik van kasteel Huys ter Horst kunt u op dit' +
      'e-mail adres: rondleiding@kasteelhuysterhorst.nl terecht. ';
  final adres = 'Stichting kasteel Huys ter Horst\n' +
      'p/a Pr. Margrietstraat 24\n' +
      '5961 BL Horst\n';
  final adresTitel = 'Bezoekadres';
  final subTitel = 'Agenda';
  final imageUrl = 'http://www.kasteelhuysterhorst.nl/fotos/DSC_0434.jpg';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            bottom: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(adresTitel,
                        style: Theme.of(context).textTheme.headline),
                    MarkdownBody(
                      data: adres,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  subTitel,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              MarkdownBody(
                data: content,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(imageUrl),
              ),
            ],
          ),
        )
      ],
    );
  }
}
