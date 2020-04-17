import 'package:flutter/material.dart';

import './room_detail_screen.dart';
import '../../widgets/rooms_category.dart';
import '../../data/dummy_data.dart';
import '../../models/room.dart';

class RoomScreen extends StatelessWidget {
  static const routeName = '/rooms';

  final List<Room> roomList = DUMMY_ROOM;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 22, top: 13),
                child: Text(
                  'Rooms List Now',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  top: 17,
                ),
                child: Icon(
                  Icons.today,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Divider(
              color: Colors.black,
              thickness: 2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 40,
                    ),
                    labelText: 'Searching',
                    hintText: 'input a room name here',
                  ),
                ),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.57,
            child: ListView.builder(
              itemBuilder: (ctx, index) => RoomsCategory(
                roomList[index].title,
                roomList[index].id,
                roomList[index].description,
                roomList[index].category,
                roomList[index].imgPath,
                roomList[index].location,
              ),
              itemCount: roomList.length,
            ),
          ),
        ],
      ),
    );
  }
}
