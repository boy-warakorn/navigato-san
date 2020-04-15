import 'package:flutter/material.dart';

import './room_detail_screen.dart';
import '../widgets/rooms_category.dart';
import '../data/dummy_data.dart';
import '../models/room.dart';

class RoomScreen extends StatelessWidget {
  static const routeName = '/rooms';

  final List<Room> roomList = DUMMY_ROOM;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white24,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    labelText: 'Searching',
                    hintText: 'input a room name here',
                  ),
                ),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
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
