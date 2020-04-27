import 'package:flutter/material.dart';

import './room_detail_screen.dart';
import '../../widgets/rooms_category.dart';
import '../../data/dummy_data.dart';
import '../../models/room.dart';

class RoomScreen extends StatefulWidget {
  static const routeName = '/rooms';

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final List<Room> roomList = DUMMY_ROOM;
  List<Room> roomSearch;

  final _inputController = TextEditingController();
  String textTest = '';

  void _submitData() {
    if (_inputController.text.isEmpty) {
      setState(() {
        textTest = '';
      });

      return;
    }
    setState(() {
      textTest = _inputController.text;
      print(textTest);
      roomSearch = DUMMY_ROOM
          .where(
            (room) => room.title.toLowerCase().contains(
                  textTest.toLowerCase(),
                ),
          )
          .toList();
    });
  }

  // List<Room> _searching(String text) {
  //   print(DUMMY_ROOM.where((id) => id.id == '1'));
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 22, top: 13),
                child: Text(
                  'Zones in Exhibition',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                width: 300,
                child: TextField(
                  controller: _inputController,
                  onSubmitted: (_) => _submitData(),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 40,
                    ),
                    labelText: 'Searching',
                    labelStyle: TextStyle(
                      fontSize: 15,
                    ),
                    hintText: 'input a room name here',
                  ),
                ),
              )
            ],
          ),
          textTest == ''
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.6,
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
                )
              : Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => RoomsCategory(
                      roomSearch[index].title,
                      roomSearch[index].id,
                      roomSearch[index].description,
                      roomSearch[index].category,
                      roomSearch[index].imgPath,
                      roomSearch[index].location,
                    ),
                    itemCount: roomSearch.length,
                  ),
                ),
        ],
      ),
    );
  }
}
