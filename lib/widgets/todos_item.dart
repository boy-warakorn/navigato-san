import 'package:flutter/material.dart';
import '../screens/room/room_detail_screen.dart';

class TodoList extends StatefulWidget {
  final String id;
  final String title;
  final String imgPath;

  TodoList(
    this.id,
    this.title,
    this.imgPath,
  );

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void goRoomDetail(BuildContext context) {
    setState(() {
      Navigator.of(context).pushNamed(
        RoomDetailScreen.routeName,
        arguments: [
          widget.id,
          false,
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goRoomDetail(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        color: Colors.orange[300],
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Hero(
                tag: widget.id + '1',
                child: Image.asset(
                  widget.imgPath,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: widget.title.length < 11
                          ? Text(
                              'Name : ${widget.title}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            )
                          : Text(
                              'Name : ${widget.title.substring(0, 10)}..',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
