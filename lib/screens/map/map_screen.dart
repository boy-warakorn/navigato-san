import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import './map_full_screen.dart';
import '../../widgets/map.dart';
import 'dart:async';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  void goMapsFull(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MapsFullScreen.routeName);
  }

  final _origin =
      Location(name: "origin", latitude: 13.639810, longitude: 100.509232);

  final _destination = Location(
      name: "LX exhibition", latitude: 13.652011, longitude: 100.494209);

  MapboxNavigation _directions;

  bool _arrived = false;

  double _distanceRemaining, _durationRemaining;
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    _directions = MapboxNavigation(onRouteProgress: (arrived) async {
      _distanceRemaining = await _directions.distanceRemaining;
      _durationRemaining = await _directions.durationRemaining;

      setState(() {
        _arrived = arrived;
      });
      if (arrived) {
        await Future.delayed(Duration(seconds: 3));
        await _directions.finishNavigation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Text(
                    'LX building destination',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  height: 420,
                  child: MapTest(),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orange.withOpacity(0.5),
                    ),
                    child: Text(
                      'click red marker to show tools bar',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Flexible(
                //   flex: 3,
                //   child: Container(
                //     margin: const EdgeInsets.only(left: 10),
                //     width: 190,
                //     child: TextField(
                //       decoration: InputDecoration(
                //         prefixIcon: Icon(
                //           Icons.search,
                //         ),
                //         labelText: 'Searching',
                //         hintText: 'input a room name here',
                //       ),
                //     ),
                //   ),
                // ),
                // Expanded(
                //   flex: 1,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.orange,
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: FlatButton(
                //       onPressed: () => goMapsFull(context),
                //       child: FittedBox(
                //         fit: BoxFit.cover,
                //         child: Text(
                //           'Facilites',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.orange.withOpacity(0.8),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      await _directions.startNavigation(
                          origin: _origin,
                          destination: _destination,
                          mode: NavigationMode.walking,
                          simulateRoute: false,
                          language: "English",
                          units: VoiceUnits.metric);
                    },
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Row(
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.searchPlus,
                            size: 25,
                            color: Colors.white,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Fullscreen',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // FloatingActionButton(
                //   backgroundColor: Colors.orange,
                //   child: Icon(Icons.fullscreen,color: Colors.white,),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
