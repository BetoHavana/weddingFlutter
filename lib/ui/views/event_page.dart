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
              SizedBox(
                height: 20,
              ),
              Text(
                    '¡Nos casamos!',
                    style: subitles,
                  ),
               FittedBox(
                fit: BoxFit.contain,
                child: 
               
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(children: [
                    Container(
                      height: 200,
                      width: 200,
                      margin: EdgeInsets.only(top: 20),
                      child: CircleAvatar(backgroundImage: AssetImage('assets/mane.jpeg'),),
                    ),
                    Text('Emmanuel', style: commonTextStyle,)
                  ]),
                  SizedBox(width: 50),
                  Column(children: [
                    Container(
                      height: 200,
                      width: 200,
                      margin: EdgeInsets.only(top: 20),
                      child: CircleAvatar(backgroundImage: AssetImage('assets/mena.jpeg'),),
                    ),
                    Text('Brenda', style: commonTextStyle,)
                  ]),
                ],
              ),
               ),
              SizedBox(height: 20),
              
              FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                    padding: EdgeInsets.all(15), 
                    child: Text(
                      '19 de noviembre de 2022 - Peñamiller, Qro.',
                      style: dateText,
                    ),
              )),
              SizedBox(height: 20),
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