import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/models/constants.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class WhenWherePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondColor,
      child: Center(
        child: SingleChildScrollView(
            child: Column(
              children: [
                FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Lugar & Fecha',
                      style: GoogleFonts.dancingScript(
                          fontSize: 80, fontWeight: FontWeight.bold),
                    ),
                  )
                ),
                Home()
              ],
            )
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
        child: FlutterMap(
          options: MapOptions(
            center: latLng.LatLng(21.053639566544316, -99.81399734632383),
            zoom: 16.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: latLng.LatLng(21.053639566544316, -99.81399734632383),
                  builder: (ctx) => Container(
                    child: Icon(Icons.location_city_outlined),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}
