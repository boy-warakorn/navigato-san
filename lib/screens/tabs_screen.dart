import 'package:flutter/material.dart';
import 'package:mobile_project/screens/contact_screen.dart';
import 'package:mobile_project/screens/map_screen.dart';
import 'package:mobile_project/screens/todo_screen.dart';

import './main_screen.dart';
import './rooms_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedIndex = 0;

  void initState() {
    _pages = [
      {
        'page': RoomScreen(),
        'title': 'Rooms',
      },
      {
        'page': TodoScreen(),
        'title': 'Todos',
      },
      {
        'page': MainScreen(),
        'title': 'Main',
      },
      {
        'page': MapScreen(),
        'title': 'Map',
      },
      {
        'page': ContactScreen(),
        'title': 'Contact',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Container(
          width: 150,
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.orange.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              _pages[_selectedIndex]['title'],
              style: TextStyle(color: Colors.white,fontSize: 25),
              
            ),
          ),
        ),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.orangeAccent,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(
              Icons.pageview,
              size: 35,
            ),
            title: Text('Rooms'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(
              Icons.save,
              size: 35,
            ),
            title: Text('To-do'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(
              Icons.room,
              size: 40,
            ),
            title: Text('Main'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(
              Icons.map,
              size: 35,
            ),
            title: Text('Maps'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(
              Icons.phone,
              size: 35,
            ),
            title: Text('Contact'),
          ),
        ],
      ),
    );
  }
}
