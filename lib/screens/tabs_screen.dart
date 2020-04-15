import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widgets/main_drawer.dart';
import '../models/room.dart';
import './contact_screen.dart';
import './map_screen.dart';
import './todo_screen.dart';
import './main_screen.dart';
import './rooms_screen.dart';

class TabsScreen extends StatefulWidget {
  List<Room> todoRoom = [];
  TabsScreen(this.todoRoom);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedIndex = 2;

  void initState() {
    _pages = [
      {
        'page': RoomScreen(),
        'title': 'Rooms',
      },
      {
        'page': TodoScreen(widget.todoRoom),
        'title': 'To-Dos',
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
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Container(
          width: 150,
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              _pages[_selectedIndex]['title'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.orange,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.deepOrange.withOpacity(0.8),
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(
              Icons.pageview,
              size: 30,
            ),
            title: Text('Rooms'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(
              Icons.local_activity,
              size: 30,
            ),
            title: Text('To-do'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(
              Icons.room,
              size: 35,
            ),
            title: Text('Main'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(
              Icons.explore,
              size: 30,
            ),
            title: Text('Maps'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(
              Icons.contact_phone,
              size: 30,
            ),
            title: Text('Contact'),
          ),
        ],
      ),
    );
  }
}
