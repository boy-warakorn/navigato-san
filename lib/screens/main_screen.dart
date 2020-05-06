import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/annoucement/annoucement_list_screen.dart';

import '../models/user_location.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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

  void goAnnoucementList(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(AnnoucementList.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    var origin = Location(
        name: "origin",
        latitude: userLocation.lat == null ? 10 : userLocation.lat,
        longitude: userLocation.long);

    if (userLocation.lat == null || userLocation.long == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                height: 210,
                child: Image.asset(
                  'assets/images/marker.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: <Widget>[
                FlatButton(
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
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.34,
              child: Carousel(
                dotSize: 4.0,
                dotSpacing: 10,
                dotColor: Colors.orange,
                dotIncreasedColor: Colors.orange,
                borderRadius: true,
                indicatorBgPadding: 5.0,
                autoplayDuration: Duration(
                  seconds: 3,
                ),
                images: [
                  AssetImage('assets/images/oro.jpg'),
                  AssetImage('assets/images/dummy1.jpg'),
                  AssetImage('assets/images/dummy2.jpg'),
                  AssetImage('assets/images/dummy3.jpg'),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}
