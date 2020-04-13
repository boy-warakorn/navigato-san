import 'package:flutter/material.dart';

import '../models/room.dart';
import '../screens/room_detail_screen.dart';

class RoomsCategory extends StatelessWidget {
  final String title;
  final String id;
  final String description;
  final Category category;

  RoomsCategory(
    this.title,
    this.id,
    this.description,
    this.category,
  );

  void goRoomDetail(BuildContext context) {
    Navigator.of(context).pushNamed(
      RoomDetailScreen.routeName,
      arguments: id,
    );
  }

  IconData get iconOfRoom {
    switch (category) {
      case Category.Education:
        return Icons.school;

        break;
      case Category.Game:
        return Icons.videogame_asset;

        break;
      case Category.Show:
        return Icons.live_tv;

        break;

      default:
        return Icons.device_unknown;
    }
  }

  String get typeOfRoom {
    switch (category) {
      case Category.Education:
        return 'Education';

        break;
      case Category.Game:
        return 'Game';

        break;
      case Category.Show:
        return 'Show';

        break;

      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goRoomDetail(context),
      child: Card(
        color: Colors.orange[300],
        margin: EdgeInsets.all(30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                'assets/images/dummy2.jpg',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    'Title: ${title}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Icon(iconOfRoom),
                      SizedBox(width: 5),
                      Text(typeOfRoom),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             width: 300,
//             child: Card(
//               color: Colors.orange[300],
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               margin: EdgeInsets.symmetric(vertical: 10),
//               elevation: 10,
//               child: InkWell(
//                 onTap: () {},
//                 splashColor: Colors.orange,
//                 child: ListTile(
//                   contentPadding: EdgeInsets.only(left: 10),
//                   leading: ConstrainedBox(
//                     constraints: BoxConstraints(
//                       minWidth: 100,
//                       minHeight: 100,
//                       maxWidth: 200,
//                       maxHeight: 200,
//                     ),
//                     child: Image.asset('assets/images/marker.png',
//                         fit: BoxFit.cover),
//                   ),
//                   title: Text(roomList[index].title),
//                   subtitle: Text(roomList[index].description),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
