import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/user_location.dart';

class MapGenerate extends StatefulWidget {
  @override
  _MapGenerateState createState() => _MapGenerateState();
}

class _MapGenerateState extends State<MapGenerate> {
  var _destination = Location(
      name: "LX exhibition", latitude: 13.652011, longitude: 100.494209);

  MapboxNavigation _directions;

  bool _arrived = false;

  double _distanceRemaining, _durationRemaining;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    Future.delayed(
      Duration(seconds: 2),
    );
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
    var userLocation = Provider.of<UserLocation>(context);
    var origin = userLocation != null
        ? Location(
            name: "origin",
            latitude: userLocation.getLat,
            longitude: userLocation.getLong,
          )
        : Location(
            name: "origin",
            latitude: 0,
            longitude: 0,
          );

    return FlatButton(
      onPressed: () async {
        await _directions.startNavigation(
            origin: origin,
            destination: _destination,
            mode: NavigationMode.drivingWithTraffic,
            simulateRoute: false,
            language: "English",
            units: VoiceUnits.metric);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            colors: [
              Colors.orange,
              Colors.orange.withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(
          2,
        ),
        margin: EdgeInsets.only(
          top: 5,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Navigate to LX Building',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black.withOpacity(1),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              FaIcon(FontAwesomeIcons.directions),
            ],
          ),
        ),
      ),
    );
  }
}
