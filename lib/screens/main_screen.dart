import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import '../screens/map/map_full_screen.dart';
import '../screens/annoucement/annoucement_list_screen.dart';
import '../widgets/annoucements.dart';
import '../data/dummy_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/annoucement.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _origin =
      Location(name: "origin", latitude: 13.639810, longitude: 100.509232);

  final _destination = Location(
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

  void goAnnoucementList(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(AnnoucementList.routeName);
  }

  @override
  Widget build(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 5),
                    child: Text(
                      'Where is LX Exhibition ?',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                        child: Text(
                          'If you don\'t know.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FaIcon(
                        FontAwesomeIcons.arrowRight,
                        color: Colors.black.withOpacity(0.5),
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      await _directions.startNavigation(
                          origin: _origin,
                          destination: _destination,
                          mode: NavigationMode.walking,
                          simulateRoute: false,
                          language: "English",
                          units: VoiceUnits.metric);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                        color: Colors.orange[300],
                      ),
                      width: MediaQuery.of(context).size.width * 0.25,
                      padding: EdgeInsets.all(
                        2,
                      ),
                      margin: EdgeInsets.only(
                        top: 5,
                      ),
                      child: Center(
                        child: Text(
                          'Click here!',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // FlatButton(
              //   onPressed: () {
              //     Navigator.of(context).pushNamed(MapsFullScreen.routeName);
              //   },
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         width: 100,
              //         height: 35,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(
              //             10,
              //           ),
              //           gradient: LinearGradient(
              //             colors: [
              //               Colors.orange,
              //               Colors.orange.withOpacity(0.8)
              //             ],
              //             begin: Alignment.centerLeft,
              //             end: Alignment.centerRight,
              //           ),
              //         ),
              //         child: Container(
              //           child: Row(
              //             children: <Widget>[
              //               Text('Click here'),
              //               SizedBox(
              //                 width: 10,
              //               ),
              //               FaIcon(
              //                 FontAwesomeIcons.route,
              //                 size: 15,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(
              //     top: 10,
              //   ),
              // child: Container(

              // child: Container(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(
              //       5,
              //     ),
              //     gradient: LinearGradient(
              //       colors: [
              //         Colors.orange,
              //         Colors.orange.withOpacity(0.6),
              //       ],
              //       begin: Alignment.topLeft,
              //       end: Alignment.bottomRight,
              //     ),
              //   ),
              //   child:
              // TextField(
              //   decoration: InputDecoration(
              //     prefixIcon: Icon(
              //       Icons.search,
              //       size: 40,
              //       color: Colors.black,
              //     ),
              //     labelText: 'Find room by category ...',
              //     labelStyle: TextStyle(
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 13,
              //     ),
              //     hintText: 'input a category here',
              //   ),
              // ),
              // ),
              //       ),
              // ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Container(
          //       margin: EdgeInsets.only(left: 45),
          //       child: Text(
          //         'Annoucement :',
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //     Container(
          //       margin: EdgeInsets.only(right: 30),
          //       child: FlatButton(
          //         onPressed: () => goAnnoucementList(context),
          //         child: Text(
          //           'See All...',
          //           style: TextStyle(
          //             fontSize: 18,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // Annoucements(),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.98,
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

// for 4 button
// SizedBox(
//   height: 50,
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: <Widget>[
//     buildButton('Rooms', Icons.home, context),
//     buildButton('To-do', Icons.today, context),
//   ],
// ),
// SizedBox(
//   height: 50,
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: <Widget>[
//     buildButton('Map', Icons.room, context),
//     buildButton('Contact', Icons.phone, context),
//   ],
// )
// Card(
//           margin: EdgeInsets.only(top: 15),
//           color: Colors.transparent,
//           elevation: 10,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.orange.withOpacity(0.5),
//                   Colors.orange,
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             padding: EdgeInsets.all(10),
//             width: 350,
//             height: 200,
//             child: Annoucements(
//               title: 'asdasd',
//               description: 'asdasdsd',
//             ),
//           ),
//         ),
