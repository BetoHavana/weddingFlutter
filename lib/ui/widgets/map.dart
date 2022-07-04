import 'package:flutter/material.dart';
import 'package:wedding/models/constants.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class MapLocation extends StatefulWidget {
  const MapLocation({Key? key}) : super(key: key);

  @override
  _MapLocationState createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 250,
        child: FlutterMap(
          options: MapOptions(
            center: latLng.LatLng(21.053639566544316, -99.81399734632383),
            zoom: 16.5,
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
                    child: Icon(Icons.location_on,size: 50,),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}
