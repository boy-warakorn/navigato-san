import 'package:flutter/material.dart';
import './screens/main_screen.dart';

import 'dart:async';
import './screens/contact_screen.dart';
import './data/dummy_data.dart';
import './screens/annoucement/annoucement_list_screen.dart';
import './models/room.dart';
import './screens/room/room_detail_screen.dart';
import './screens/map/map_full_screen.dart';
import './screens/tabs_screen.dart';
import './screens/room/rooms_screen.dart';
import './screens/room/room_detail_screen_withoutButton.dart';
import './models/annoucement.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Room> _todoRoom = [];
  final List<Annoucement> annouceData = DUMMY_ANNOUCEMENT;

  void _toggleFavorite(String roomId) {
    final existingIndex = _todoRoom.indexWhere((room) => room.id == roomId);
    if (existingIndex >= 0) {
      setState(() {
        _todoRoom.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _todoRoom.add(
          DUMMY_ROOM.firstWhere((room) => room.id == roomId),
        );
      });
    }
  }

  bool _isRoomTodo(String id) {
    return _todoRoom.any((room) => room.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Kanit',
        primaryColor: Colors.orangeAccent,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => SplashScreen(_todoRoom),
        '/main': (ctx) => TabsScreen(_todoRoom),
        MapsFullScreen.routeName: (ctx) => MapsFullScreen(),
        RoomScreen.routeName: (ctx) => RoomScreen(),
        RoomDetailScreen.routeName: (ctx) =>
            RoomDetailScreen(_toggleFavorite, _isRoomTodo),
        RoomDetailScreen2.routeName: (ctx) =>
            RoomDetailScreen2(_toggleFavorite, _isRoomTodo),
        AnnoucementList.routeName: (ctx) => AnnoucementList(annouceData),
        ContactScreen.routeName: (ctx) => ContactScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  List<Room> todoRoom;

  SplashScreen(this.todoRoom);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double itemSize = 0;
  double opacity = 0;

  Duration animationDuration = Duration(seconds: 1);

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
          child: TabsScreen(widget.todoRoom),
          type: null,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 1), () {
      setState(() {
        opacity = 1;
      });
    });
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splashscreen.jpg'),
              ),
            ),
            child: null,
          ),
          Positioned(
            top: 200,
            left: 130,
            child: AnimatedOpacity(
              duration: animationDuration,
              opacity: opacity,
              child: AnimatedContainer(
                duration: animationDuration,
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.asset(
                  'assets/images/marker.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
