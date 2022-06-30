import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wedding/models/constants.dart';
import 'package:wedding/providers/page_provider.dart';
import 'package:wedding/ui/widgets/widgets.dart';

class MovilMenuItem extends StatefulWidget {

  final String text;
  final Function onPressed;
  final int delay;

  const MovilMenuItem({
    Key? key,
    required this.text,
    required this.onPressed, 
    this.delay = 0
  }) : super(key: key);

  @override
  _MovilMenuItemState createState() => _MovilMenuItemState();
}

class _MovilMenuItemState extends State<MovilMenuItem> {

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 10,
      duration: Duration(milliseconds: 150),
      delay: Duration( milliseconds: widget.delay ),
      child: MouseRegion(
        onEnter: ( _ ) => setState(() => isHover = true ),
        onExit: ( _ ) => setState(() => isHover = false ),
        child: GestureDetector(
          onTap: () => widget.onPressed(),
          child: AnimatedContainer(
            duration: Duration( milliseconds: 300 ),
            width: 150,
            height: 50,
            color: isHover ? secondColor : Colors.transparent,
            child: Center(
              child: Text(
                widget.text,
                style: GoogleFonts.kalam( fontSize: 20, color: Colors.white )
              ),
            ),
          ),
        ),
      ),
    );
  }
}