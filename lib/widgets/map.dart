import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTest extends StatefulWidget {
  @override
  _MapTestState createState() => _MapTestState();
}

class _MapTestState extends State<MapTest> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(13.651932, 100.493780),
        zoom: 20,
      ),
      markers: {
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(13.651932, 100.493780),
          infoWindow:
              InfoWindow(title: 'LX building', snippet: 'สถานที่จัดงาน'),
        ),
      },
    );
  }
}
