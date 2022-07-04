import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wedding/providers/page_provider.dart';
import 'package:wedding/ui/widgets/widgets.dart';

class MovilAppMenu extends StatefulWidget {
  @override
  _MovilAppMenuState createState() => _MovilAppMenuState();
}

class _MovilAppMenuState extends State<MovilAppMenu> with SingleTickerProviderStateMixin {

  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() { 
    super.initState();
    
    controller = AnimationController(vsync: this, duration: Duration( milliseconds: 200 ));
  }

  @override
  Widget build(BuildContext context) {

    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: (){ 
          
          if ( isOpen ) {
            controller.reverse();
          } else {
            controller.forward();
          }

          setState(() {
            isOpen = !isOpen;
          });

        },
        child: Container(
          padding: EdgeInsets.symmetric( horizontal: 10 ),
          width: isOpen ? 150 : 60, //tamano del cuadro negro
          height: isOpen ? 308: 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),

              if ( isOpen )
                ...[
                  MovilMenuItem( delay: 0, text: 'Inicio', onPressed: () => pageProvider.goTo(0)),
                  MovilMenuItem( delay: 30, text: 'Los Novios', onPressed: () => pageProvider.goTo(1)),
                  MovilMenuItem( delay: 60, text: 'Evento', onPressed: () => pageProvider.goTo(2)),
                  MovilMenuItem( delay: 90, text: 'Galeria', onPressed: () => pageProvider.goTo(3)),
                  MovilMenuItem( delay: 120, text: 'Registro', onPressed: () => pageProvider.goTo(4)),
                  SizedBox( height: 8 )
                ]
            ],
          ),
        ),
      ),
    );
  }
}




class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40, //ancho del icono
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration( milliseconds: 200 ),
            curve: Curves.easeInOut,
            width: isOpen ? 0 : 0,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller, 
            color: Colors.white,
          )
        ],
      ),
    );
  }
}