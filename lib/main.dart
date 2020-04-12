import 'package:flutter/material.dart';
import 'package:mobile_project/screens/tabs_screen.dart';

import './screens/rooms_screen.dart';
import './screens/main_screen.dart';

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
          RoomScreen.routeName: (ctx) => RoomScreen(),
        });
  }
}
