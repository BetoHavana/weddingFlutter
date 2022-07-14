import 'package:flutter/material.dart';
import 'package:wedding/models/constants.dart';

class GalleryDetails extends StatelessWidget {
  final String imagePath;
  final String title;
  final String photographer;
  final String price;
  final String details;
  final int index;
  GalleryDetails(
      {required this.imagePath,
      required this.title,
      required this.photographer,
      required this.price,
      required this.details,
      required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Hero(
                tag: 'logo$index',
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              padding: EdgeInsets.symmetric(vertical: 15),
              color: secondColor,
              child: Text(
                'Volver',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            /*Container(
              height: 260,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'By $photographer',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          price,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          details,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: secondColor,
                          child: Text(
                            'Volver',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: Colors.lightBlueAccent,
                          child: Text(
                            'Buy',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
