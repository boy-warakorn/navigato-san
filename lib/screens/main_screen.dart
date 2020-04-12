import 'package:flutter/material.dart';
import './rooms_screen.dart';

class MainScreen extends StatelessWidget {
  void _selectScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(RoomScreen.routeName);
  }

  // Widget buildButton(String text, IconData icon, BuildContext context) {
  //   return Container(
  //     width: 150,
  //     height: 50,
  //     child: InkWell(
  //       borderRadius: BorderRadius.circular(15),
  //       onTap: () => _selectScreen(context),
  //       splashColor: Colors.orange,
  //       child: Container(
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: <Widget>[
  //             Icon(
  //               icon,
  //               color: Colors.white,
  //               size: 40,
  //             ),
  //             Text(
  //               text,
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 20,
  //               ),
  //             ),
  //           ],
  //         ),
  //         decoration: BoxDecoration(
  //             gradient: LinearGradient(
  //               colors: [Colors.orange.withOpacity(0.7), Colors.orange],
  //               begin: Alignment.topLeft,
  //               end: Alignment.bottomRight,
  //             ),
  //             borderRadius: BorderRadius.circular(15)),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 30),
              height: 200,
              child: Image.asset(
                'assets/images/marker.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    labelText: 'Find room',
                    hintText: 'input a room name here',
                  ),
                ),
              )
            ],
          ),
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
        ],
      ),
    );
  }
}
