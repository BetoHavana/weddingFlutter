import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/models/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/widgets.dart';

class GalleyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyGallery();
  }
}

class MyGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FittedBox(
                  child: Padding(
                    padding: EdgeInsets.only(top:50,left: 50,right: 50),
                    child: Text(
                      'Galeria',
                      style: titles,
                    ),
                  )
                ),
          Container(
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(left :50.0,right: 50.0),
              child: GalleryWidget() /*StaggeredGridView.countBuilder(
              scrollDirection: Axis.horizontal,
              crossAxisCount: 4,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) => new Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        NetworkImage('https://picsum.photos/500/500?random=$index'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 3 : 2),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),*/
            )
          )
        ]
      ),
    );
  }
}
