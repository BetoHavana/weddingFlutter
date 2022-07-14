import 'package:flutter/material.dart';
import 'widgets.dart';

List<ImageDetails> _images = [
  ImageDetails(
    imagePath: 'assets/1.jpeg',
    price: '\$20.00',
    photographer: 'Martin Andres',
    title: 'New Year',
    details:
        'This image was taken during a party in New York on new years eve. Quite a colorful shot.',
  ),
  ImageDetails(
    imagePath: 'assets/2.jpeg',
    price: '\$10.00',
    photographer: 'Abraham Costa',
    title: 'Spring',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'assets/3.jpeg',
    price: '\$30.00',
    photographer: 'Jamie Bryan',
    title: 'Casual Look',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'assets/4.jpeg',
    price: '\$30.00',
    photographer: 'Jamie Bryan',
    title: 'Casual Look',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'assets/5.jpeg',
    price: '\$30.00',
    photographer: 'Jamie Bryan',
    title: 'Casual Look',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'assets/6.jpeg',
    price: '\$30.00',
    photographer: 'Jamie Bryan',
    title: 'Casual Look',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'assets/7.jpeg',
    price: '\$30.00',
    photographer: 'Jamie Bryan',
    title: 'Casual Look',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'assets/8.jpeg',
    price: '\$30.00',
    photographer: 'Jamie Bryan',
    title: 'Casual Look',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'assets/9.jpeg',
    price: '\$30.00',
    photographer: 'Jamie Bryan',
    title: 'Casual Look',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'assets/10.jpeg',
    price: '\$30.00',
    photographer: 'Jamie Bryan',
    title: 'Casual Look',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'assets/11.jpeg',
    price: '\$30.00',
    photographer: 'Jamie Bryan',
    title: 'Casual Look',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'assets/12.jpeg',
    price: '\$30.00',
    photographer: 'Jamie Bryan',
    title: 'Casual Look',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'assets/13.jpeg',
    price: '\$30.00',
    photographer: 'Jamie Bryan',
    title: 'Casual Look',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
];

class GalleryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GalleryDetails(
                              imagePath: _images[index].imagePath,
                              title: _images[index].title,
                              photographer: _images[index].photographer,
                              price: _images[index].price,
                              details: _images[index].details,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'logo$index',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(_images[index].imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageDetails {
  final String imagePath;
  final String price;
  final String photographer;
  final String title;
  final String details;
  ImageDetails({
    required this.imagePath,
    required this.price,
    required this.photographer,
    required this.title,
    required this.details,
  });
}
