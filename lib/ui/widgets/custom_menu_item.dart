import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/models/constants.dart';
import 'package:wedding/models/flags.dart';

class CustomMenuItem extends StatefulWidget {
  final String text;
  final Function onPressed;
  final int delay;

  const CustomMenuItem(
      {Key? key, required this.text, required this.onPressed, this.delay = 0})
      : super(key: key);

  @override
  _CustomMenuItemState createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: FadeInLeft(
        from: 20,
        duration: Duration(milliseconds: 150),
        delay: Duration(milliseconds: widget.delay),
        child: MouseRegion(
          onEnter: (_) => setState(() => isHover = true),
          onExit: (_) => setState(() => isHover = false),
          child: GestureDetector(
            onTap: () => widget.onPressed(),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 0),
              width: 110,
              height: 60,
              //color: isHover ? primaryColor : Colors.transparent,
              child: Center(
                  child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text(widget.text,
                          style: GoogleFonts.kalam(
                              fontSize: 20, color: Colors.black))),
                  isHover
                      ? Container(height: 5, width: 80, color: primaryColor)
                      : Container(),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
