import 'package:flutter/material.dart';
import './data/dummy_data.dart';

import './models/room.dart';
import './screens/room_detail_screen.dart';
import './screens/map_full_screen.dart';
import './screens/tabs_screen.dart';
import './screens/rooms_screen.dart';
import './screens/room_detail_screen_withoutButton.dart';

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
          '/': (ctx) => TabsScreen(_todoRoom),
          MapsFullScreen.routeName: (ctx) => MapsFullScreen(),
          RoomScreen.routeName: (ctx) => RoomScreen(),
          RoomDetailScreen.routeName: (ctx) =>
              RoomDetailScreen(_toggleFavorite, _isRoomTodo),
          RoomDetailScreen2.routeName: (ctx) =>
              RoomDetailScreen2(_toggleFavorite, _isRoomTodo),
        });
  }
}
