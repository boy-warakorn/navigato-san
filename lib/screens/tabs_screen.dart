import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/main_drawer.dart';

import './layout_map/layout_map_screen.dart';
import './contact_screen.dart';
import './todo_screen.dart';
import './main_screen.dart';
import './room/rooms_screen.dart';
import '../screens/room/room_detail_screen.dart';

import '../models/room.dart';

class TabsScreen extends StatefulWidget {
  List<Room> todoRoom = [];
  TabsScreen(this.todoRoom);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  Widget _buildButton(String text, String id) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        gradient: LinearGradient(
          colors: [
            Colors.orange.withOpacity(1),
            Colors.orange.withOpacity(0.7)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            RoomDetailScreen.routeName,
            arguments: [
              id,
              false,
            ],
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            text.length < 16
                ? Text(
                    text,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  )
                : Text(
                    text.substring(
                          0,
                          15,
                        ) +
                        '...',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  List<Map<String, Object>> _pages;
  int _selectedIndex = 2;
  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      'Zones list in Layout Map',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _buildButton('Exhibition Zone', '1'),
                      _buildButton('Escape Room', '2'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _buildButton('ORO', '3'),
                      _buildButton('Pop up Exhibition', '8'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _buildButton('LX Building studies', '5'),
                      _buildButton('MC. show room', '6'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _buildButton('Entrepeneur innovation', '7'),
                      _buildButton('Research show', '4'),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: <Widget>[
                  //     _buildButton('Vending Machine', '0'),
                  //     _buildButton('Toilet', '0'),
                  //   ],
                  // ),
                ],
              ),
            ),
          );
        });
  }

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
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Colors.orangeAccent,
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
                'Zones',
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
                onPressed: () => _showModalSheet(),
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
          backgroundColor: Colors.orange[200],
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
