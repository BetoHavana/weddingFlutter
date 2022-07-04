import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wedding/models/constants.dart';
import '../widgets/widgets.dart';

class WhenWherePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: secondColor,
      child:  Column(
          children: [
            SizedBox(height: 30),
            FittedBox(
                child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Lugar & Fecha',
                style: GoogleFonts.dancingScript(
                    fontSize: 80, fontWeight: FontWeight.bold),
              ),
            )),
           Container(
            child:  SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: locationsRow(width) ,
            ),
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
      width: _width != null ? _width / 2 : _width,
      child: CardContainer(
        child: Column(
          children: [
            Text('Ceremonia'),
            Image(
              image: AssetImage('assets/iglesia.png'),
              width: 200,
              height: 250,
            ),
            //MapLocation(),
            Text(
                'Santamaría de la asunción, And. Juárez 1, Centro, 76496 Peñamiller, Qro.'),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor)),
                onPressed: _launchUrl,
                child: Text('Ver Mapa',
                    style: TextStyle(fontSize: 14, color: Colors.black))),
          ],
        ),
      ),
    );
  }

  Widget cardSalon(double _width) {
    return Container(
      width: _width != null ? _width / 2 : _width,
      child: CardContainer(
        child: Column(
          children: [
            Text('Fiesta'),
            Image(
              image: AssetImage('assets/iglesia.png'),
              width: 200,
              height: 250,
            ),
            // MapLocation(),
            Text(
                'Santamaría de la asunción, And. Juárez 1, Centro, 76496 Peñamiller, Qro.'),
            Text('boton de mapa'),
          ],
        ),
      ),
    );
  }

  void _launchUrl() async {
    final Uri _url = Uri.parse("https://goo.gl/maps/gGLWamrZo9889Dby6");
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
