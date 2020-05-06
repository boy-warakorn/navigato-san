import 'package:flutter/material.dart';
import '../screens/faq_screen.dart';

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
          fontSize: 20,
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
            color: Colors.orange[300],
            child: Text(
              'Navigato-san',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Faq.',
            Icons.question_answer,
            () {
              Navigator.of(context).pushNamed(FAQScreen.routeName);
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
