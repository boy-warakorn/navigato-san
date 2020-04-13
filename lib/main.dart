import 'package:flutter/material.dart';

import './screens/room_detail_screen.dart';
import './screens/map_full_screen.dart';
import './screens/tabs_screen.dart';
import './screens/rooms_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
          '/': (ctx) => TabsScreen(),
          MapsFullScreen.routeName: (ctx) => MapsFullScreen(),
          RoomScreen.routeName: (ctx) => RoomScreen(),
          RoomDetailScreen.routeName: (ctx) => RoomDetailScreen(),
        });
  }
}
