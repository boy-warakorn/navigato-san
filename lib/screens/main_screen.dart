import 'package:flutter/material.dart';
import 'package:mobile_project/widgets/annoucements.dart';

class MainScreen extends StatelessWidget {
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
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    labelText: 'Find room',
                    hintText: 'input a room name here',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 45),
                child: Text(
                  'Annoucement : ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'See All...',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Annoucements(),
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
