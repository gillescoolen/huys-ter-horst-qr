import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
  final adres = 'Stichting kasteel Huys ter Horst\n' +
      'p/a Pr. Margrietstraat 24\n' +
      '5961 BL Horst\n';
  final adresTitel = 'Adres';
  final subTitel = 'Stichting Kasteel Huys Ter Horst';

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
              )
            ],
          ),
        )
      ],
    );
  }
}
