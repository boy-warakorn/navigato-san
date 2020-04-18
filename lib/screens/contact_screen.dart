import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatelessWidget {
  Widget buildContactBlock(String text, FaIcon icon) {
    return Center(
      child: Container(
        height: 50,
        width: 250,
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 5),
            icon,
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                margin: EdgeInsets.only(left: 5),
                child: FittedBox(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.orange,
              Colors.orange.withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80),
              bottomRight: Radius.circular(80),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Image.asset(
                'assets/images/kmuttTem.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          buildContactBlock(': SIT KMUTT', FaIcon(FontAwesomeIcons.facebook)),
          SizedBox(
            height: 15,
          ),
          buildContactBlock(
              ': @regiskmutt', FaIcon(FontAwesomeIcons.instagram)),
          SizedBox(
            height: 15,
          ),
          buildContactBlock(
              ': sit.kmutt.ac.th', FaIcon(FontAwesomeIcons.globeAsia)),
          SizedBox(
            height: 15,
          ),
          buildContactBlock(': 02-470-8000', FaIcon(FontAwesomeIcons.phone)),
          SizedBox(
            height: 17,
          ),
          // Container(
          //   height: 220,
          //   child: Image.asset('assets/images/test.png'),
          // )
        ],
      ),
    );
  }
}
