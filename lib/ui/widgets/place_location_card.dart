import 'package:flutter/material.dart';
import 'package:wedding/models/constants.dart';
import 'package:wedding/ui/widgets/widgets.dart';

class PlaceLocationCard extends StatelessWidget {
  final double? width;
  const PlaceLocationCard({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    return CardContainer(
      width: width != null ? currentWidth:width ,
      child: Column(
        children: [
          Text('Imagen'),
          Text('direccion'),
          Text('boton de mapa'),
        ],
      ),
    );
  }
}
