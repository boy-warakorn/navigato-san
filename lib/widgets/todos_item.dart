import 'package:flutter/material.dart';
import '../screens/room_detail_screen_withoutButton.dart';

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
        RoomDetailScreen2.routeName,
        arguments: widget.id,
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
        color: Colors.orange,
        elevation: 5,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                widget.imgPath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        'Title : ${widget.title}',
                        style: TextStyle(
                          color: Colors.white70 ,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
