import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding/ui/widgets/widgets.dart';

import '../../providers/providers.dart';

class NewMenu extends StatefulWidget {
  NewMenu({Key? key}) : super(key: key);

  @override
  State<NewMenu> createState() => _NewMenuState();
}

class _NewMenuState extends State<NewMenu> {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return Container(
          padding: EdgeInsets.symmetric( horizontal: 10 ),
          width: MediaQuery.of(context).size.width,
          height: 85,
          color: Colors.transparent,
          child: Row(
            children: [
                  CustomMenuItem( delay: 0, text: 'Inicio', onPressed: () => pageProvider.goTo(0)),
                  CustomMenuItem( delay: 30, text: 'Los Novios', onPressed: () => pageProvider.goTo(1)),
                  CustomMenuItem( delay: 60, text: 'Evento', onPressed: () => pageProvider.goTo(2)),
                  CustomMenuItem( delay: 90, text: 'Galeria', onPressed: () => pageProvider.goTo(3)),
                  CustomMenuItem( delay: 120, text: 'Registro', onPressed: () => pageProvider.goTo(4)),
                  SizedBox( height: 8 )
            ]
          ),
        );
  }
}