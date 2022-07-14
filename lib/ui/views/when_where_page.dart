import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wedding/models/constants.dart';
import '../widgets/widgets.dart';

class WhenWherePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: secondColor,
      child: Column(
        children: [
          SizedBox(height: 30),
          FittedBox(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Lugar & Fecha',
              style: titles,
            ),
          )),
          /*Container(
            child:  SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: locationsRow(width) ,
            ),
           )*/
          FittedBox(
            fit: BoxFit.contain,
            child: locationsRow(width),
          )
        ],
      ),
    );
  }

  Widget locationsColumn(double width) {
    return Column(
      children: [cardIglesia(width), cardSalon(width)],
    );
  }

  Widget locationsRow(double myWidth) {
    return Row(
      children: [cardIglesia(myWidth), cardSalon(myWidth)],
    );
  }

  Widget cardIglesia(double _width) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      width: _width != null ? _width / 2 : _width,
      child: CardContainer(
        child: Column(
          children: [
            Text(
              'Ceremonia',
              style: commonTextStyle,
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Image(
                image: AssetImage('assets/iglesia.png'),
                width: 200,
                height: 250,
              ),
            ),
            /* Image(
              image: AssetImage('assets/iglesia.png'),
              width: 200,
              height: 250,
            ),*/
            //MapLocation(),
            Center(
              child: Text(
                'Santamaría de la asunción, And. Juárez 1, Centro, 76496 Peñamiller, Qro.',
                style: eventTextStyle,
              ),
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor)),
                  onPressed: _launchUrl,
                  child: Text('Ver Mapa', style: commonTextStyle)),
            )
          ],
        ),
      ),
    );
  }

  Widget cardSalon(double _width) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      width: _width != null ? _width / 2 : _width,
      child: CardContainer(
        child: Column(
          children: [
            Text(
              'Fiesta',
              style: commonTextStyle,
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Image(
                image: AssetImage('assets/iglesia.png'),
                width: 200,
                height: 250,
              ),
            ),
            // MapLocation(),
            Center(
                child: Text(
              'Santamaría de la asunción, And. Juárez 1, Centro, 76496 Peñamiller, Qro.',
              style: eventTextStyle,
            )),
            FittedBox(
              fit: BoxFit.contain,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor)),
                  onPressed: _launchUrlSalon,
                  child: Text('Ver Mapa', style: commonTextStyle)),
            )
          ],
        ),
      ),
    );
  }

  void _launchUrl() async {
    final Uri _url = Uri.parse("https://goo.gl/maps/gGLWamrZo9889Dby6");
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  void _launchUrlSalon() async {
    final Uri _url = Uri.parse("https://goo.gl/maps/gGLWamrZo9889Dby6");
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
