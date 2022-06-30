import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/models/constants.dart';
import 'package:wedding/models/flags.dart';
import 'package:wedding/ui/widgets/widgets.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                    'Nos casamos',
                    style: GoogleFonts.dancingScript(fontSize: 44, fontWeight: FontWeight.bold),
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(top: 20),
                      child: Image(image: AssetImage('assets/user.png')),
                    ),
                    Text('Emmanuel')
                  ]),
                  SizedBox(width: 50),
                  Column(children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(top: 20),
                      child: Image(image: AssetImage('assets/user.png')),
                    ),
                    Text('Brenda')
                  ]),
                ],
              ),
              SizedBox(height: 50),
              
              FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                    padding: EdgeInsets.all(15), 
                    child: Text(
                      '19 de noviembre de 2022 - Peñamiller, Qro.',
                      style: GoogleFonts.kalam(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
              )),
              SizedBox(height: 50),
              Container(
                height: 150,
                width: MediaQuery. of(context). size. width,
                  color: secondColor,
                  child: Padding(
                    padding: EdgeInsets.all(40), 
                    child: CountdownApp()),
                )
              ,
            ],
          ),
        ));
  }
}
