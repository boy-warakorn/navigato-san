import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

const apiKey = "AIzaSyBnKtUYBwm4BEwO3uXO6o1LCeeG9Qfssu4";

class MapTest extends StatefulWidget {
  @override
  _MapTestState createState() => _MapTestState();
}

class _MapTestState extends State<MapTest> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationEnabled: true,
      compassEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(13.652025, 100.494233),
        zoom: 11.0,
      ),
      markers: {
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(13.652025, 100.494233),
          infoWindow:
              InfoWindow(title: 'LX building', snippet: 'สถานที่จัดงาน'),
        ),
      },
    );
  }
}
