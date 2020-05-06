import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/room.dart';
import '../widgets/todos_item.dart';
import '../data/dummy_data.dart';

class TodoScreen extends StatefulWidget {
  final List<Room> todoRoom;

  TodoScreen(this.todoRoom);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  void _toggleFavorite(String roomId) {
    final existingIndex =
        widget.todoRoom.indexWhere((room) => room.id == roomId);
    if (existingIndex >= 0) {
      setState(() {
        widget.todoRoom.removeAt(existingIndex);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return FunkyOverlay();
            });
      });
    } else {
      setState(() {
        widget.todoRoom.add(
          DUMMY_ROOM.firstWhere((room) => room.id == roomId),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.todoRoom.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(left:60),
              height: 200,
              child: Image.asset(
                'assets/images/no_dummy.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            padding: EdgeInsets.all(
              7,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'No To-Do List right now!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 5,
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.solidHandPaper,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 22, top: 13),
                  child: Text(
                    'To-Dos List now',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 17,
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.listAlt,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: widget.todoRoom.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                  crossAxisCount: 2,
                ),
                itemBuilder: (ctx, index) => Stack(
                  children: <Widget>[
                    TodoList(
                      widget.todoRoom[index].id,
                      widget.todoRoom[index].title,
                      widget.todoRoom[index].imgPath,
                    ),
                    Positioned(
                      right: 2,
                      top: 3,
                      child: IconButton(
                        onPressed: () =>
                            _toggleFavorite(widget.todoRoom[index].id),
                        color: Colors.black,
                        icon: Icon(
                          Icons.delete_forever,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

class FunkyOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.deepOrangeAccent[200],
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Successful",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          Icon(
                            Icons.check,
                            size: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
