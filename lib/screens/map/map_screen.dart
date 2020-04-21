import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './map_full_screen.dart';
import '../../widgets/map.dart';

class MapScreen extends StatelessWidget {
  void goMapsFull(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MapsFullScreen.routeName);
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
                    onPressed: () => goMapsFull(context),
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
