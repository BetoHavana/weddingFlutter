import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/models/constants.dart';

import '../../models/flags.dart';

class HomeStartPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondColor,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child:  Padding(padding: EdgeInsets.all(10),
          child: Text(
              'Emmanuel & Brenda',
              style: titles,
            ),
          )
        ),
      ),
    );
  }
}