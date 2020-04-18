import 'package:flutter/material.dart';
import '../screens/contact_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.orange,
            child: Text(
              'Navigato-san',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Contact us',
            Icons.phone,
            () {
              Navigator.of(context).pushNamed(ContactScreen.routeName);
            },
          ),
          // buildListTile(
          //   'Filters',
          //   Icons.settings,
          //   () {},
          // ),
        ],
      ),
    );
  }
}