import 'package:flutter/material.dart';

import './map_full_screen.dart';
import '../widgets/map.dart';

class MapScreen extends StatelessWidget {
  void goMapsFull(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MapsFullScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 170,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      labelText: 'Searching',
                      hintText: 'input a room name here',
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                    onPressed: () => goMapsFull(context),
                    child: Text(
                      'Facilites',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                    onPressed: () => goMapsFull(context),
                    child: Text(
                      'Full screen',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
            SizedBox(height: 10),
            Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 440,
                  child: MapTest(),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    padding: EdgeInsets.all(5),
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
          ],
        ),
      ),
    );
  }
}
