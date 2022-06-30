import 'package:flutter/material.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/models/constants.dart';

class CountdownApp extends StatefulWidget {
  CountdownApp({Key? key}) : super(key: key);

  @override
  State<CountdownApp> createState() => _CountdownAppState();
}

class _CountdownAppState extends State<CountdownApp> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Center(
        child: CountDownText(
          due: DateTime.parse("2022-11-19 00:00:00"),
          finishedText: "Es hoy.!",
          showLabel: true,
          longDateName: true,
          daysTextLong: "  Días  ",
          hoursTextLong: "  Horas  ",
          minutesTextLong: "  Minutos  ",
          secondsTextLong: "  Segundos  ",
          style:
              GoogleFonts.dancingScript(fontSize: 20, fontWeight: FontWeight.normal)),
      ),
    );
    //kalam,caveat,fresca,amaranth
  }
}
