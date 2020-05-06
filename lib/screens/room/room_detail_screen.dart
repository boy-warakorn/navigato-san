import 'package:flutter/material.dart';
import '../../models/room.dart';
import '../../data/dummy_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoomDetailScreen extends StatefulWidget {
  static const routeName = '/roomDetail';
  final Function todoHandler;
  final Function isTodo;
  RoomDetailScreen(this.todoHandler, this.isTodo);

  @override
  _RoomDetailScreenState createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends State<RoomDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final roomId = ModalRoute.of(context).settings.arguments as String;
    final selectedRoom =
        DUMMY_ROOM.firstWhere((element) => roomId == element.id);
    final title = selectedRoom.title;
    final description = selectedRoom.description;
    final imgPath = selectedRoom.imgPath;
    final location = selectedRoom.location;
    final category = selectedRoom.category;
    String category_text;
    if (category == Category.Education) {
      category_text = 'Education';
    }
    if (category == Category.Game) {
      category_text = 'Game';
    }
    if (category == Category.Show) {
      category_text = 'Show';
    }

    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text(
          '${title}',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(),
            child: Image.asset(
              imgPath,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.orange[100],
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Name :',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text(
                          '${title}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(
                                right: 5,
                              ),
                              child: FaIcon(FontAwesomeIcons.tag),
                            ),
                            Text(
                              '${category_text}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: Text(
                              'Detail : ',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 5,
                            ),
                            child: Text(
                              '${description}',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: 100,
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                margin: EdgeInsets.only(
                                  left: 5,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Location :',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      '${location}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.94,
        child: FloatingActionButton.extended(
          icon: widget.isTodo(roomId)
              ? Icon(
                  Icons.favorite,
                  size: 35,
                )
              : Icon(
                  Icons.favorite_border,
                  size: 35,
                ),
          label: widget.isTodo(roomId)
              ? Text(
                  'Unadd to To-do List',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              : Text(
                  'Add to To-do List',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
          onPressed: () {
            widget.todoHandler(roomId);
          },
          backgroundColor: Colors.deepOrange[400],
        ),
      ),
    );
  }
}
