import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import '../screens/map/map_full_screen.dart';
import '../screens/annoucement/annoucement_list_screen.dart';
import '../widgets/annoucements.dart';
import '../data/dummy_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/annoucement.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main';
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
                      'Where is LX Exhibiton ?',
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
                          'If you dont know.',
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
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        MapsFullScreen.routeName,
                      );
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
                      margin: EdgeInsets.only(
                        left: 5,
                        top: 5,
                      ),
                      child: Center(
                        child: Text(
                          'Click here',
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
