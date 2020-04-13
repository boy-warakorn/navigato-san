import 'package:flutter/material.dart';
import '../widgets/map.dart';

class MapsFullScreen extends StatelessWidget {
  static const routeName = '/fullScreen';

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
