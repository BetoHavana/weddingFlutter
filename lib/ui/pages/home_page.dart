import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding/providers/page_provider.dart';
import 'package:wedding/ui/widgets/widgets.dart';
import '../views/views.dart';
import '../widgets/NewMenu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [
            _HomeBody(),
            width > 530 ? 
            Positioned(
              left: 0,
               top: 0,
               child: NewMenu()
            ) :
            Positioned( 
              right: 20,
              top: 20,
              child: MovilAppMenu()
             )
            ,
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.pink,
        Colors.purpleAccent
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [ 0.5, 0.5 ]
    )
  );
}


class _HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: [
        HomeStartPage(),
        EventPage(),
        WhenWherePage(),
        GalleyPage(),
        RegisterPage(),
      ],
    );
  }
}

