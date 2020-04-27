import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_project/screens/contact_screen.dart';

import '../data/dummy_data.dart';
import '../widgets/main_drawer.dart';
import '../models/room.dart';
import './layout_map/layout_map_screen.dart';
import './map/map_screen.dart';
import './todo_screen.dart';
import './main_screen.dart';
import './room/rooms_screen.dart';

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
        'title': 'Zones',
      },
      {
        'page': TodoScreen(widget.todoRoom),
        'title': 'To-Dos',
      },
      {
        'page': MainScreen(),
        'title': 'Navigato-san',
      },
      {
        'page': LayoutMapScreen(),
        'title': 'Layout',
      },
      {
        'page': ContactScreen(),
        'title': 'Contact us',
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
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            _pages[_selectedIndex]['title'],
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        body: _pages[_selectedIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Colors.orange,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black,
          elevation: 3,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: FaIcon(
                FontAwesomeIcons.doorOpen,
                size: 20,
              ),
              title: Text(
                'Rooms',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: FaIcon(
                FontAwesomeIcons.clipboardList,
                size: 20,
              ),
              title: Text(
                'To-do',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: Icon(
                Icons.room,
                size: 25,
              ),
              title: Text(
                'Main',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // BottomNavigationBarItem(
            //   backgroundColor: Colors.orange,
            //   icon: FaIcon(
            //     FontAwesomeIcons.mapMarkedAlt,
            //     size: 20,
            //   ),
            //   title: Text(
            //     'Where LX',
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            // ),
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: FaIcon(
                FontAwesomeIcons.mapSigns,
                size: 20,
              ),
              title: Text(
                'LX Map',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: FaIcon(
                FontAwesomeIcons.phone,
                size: 20,
              ),
              title: Text(
                'Contact',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        floatingActionButton: _selectedIndex == 3
            ? FloatingActionButton(
                backgroundColor: Colors.orange,
                onPressed: () {},
                child: Icon(
                  Icons.search,
                  size: 40,
                ),
              )
            : null,
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: Text(
            _pages[_selectedIndex]['title'],
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Colors.orange,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black,
          elevation: 3,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: FaIcon(
                FontAwesomeIcons.doorOpen,
                size: 20,
              ),
              title: Text(
                'Rooms',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: FaIcon(
                FontAwesomeIcons.clipboardList,
                size: 20,
              ),
              title: Text(
                'To-do',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: Icon(
                Icons.room,
                size: 25,
              ),
              title: Text(
                'Main',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: FaIcon(
                FontAwesomeIcons.mapMarkedAlt,
                size: 20,
              ),
              title: Text(
                'Where LX',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: FaIcon(
                FontAwesomeIcons.mapSigns,
                size: 20,
              ),
              title: Text(
                'LX Map',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    }
  }
}
