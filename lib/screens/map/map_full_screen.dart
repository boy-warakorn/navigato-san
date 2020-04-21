import 'package:flutter/material.dart';
import '../../widgets/map.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';

class MapsFullScreen extends StatefulWidget {
  static const routeName = '/fullScreen';

  @override
  _MapsFullScreenState createState() => _MapsFullScreenState();
}

class _MapsFullScreenState extends State<MapsFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: MapTest(),
    );
  }
}
