import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  Widget buildContactBlock(String text, String imgPath) {
    return Center(
      child: Container(
        height: 50,
        width: 250,
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              imgPath,
              fit: BoxFit.cover,
            ),
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
          SizedBox(
            height: 50,
          ),
          buildContactBlock(': SIT KMUTT', 'assets/images/facebook.png'),
          SizedBox(
            height: 15,
          ),
          buildContactBlock(': @regiskmutt', 'assets/images/line.png'),
          SizedBox(
            height: 15,
          ),
          buildContactBlock(': sit.kmutt.ac.th', 'assets/images/KMUTT.png'),
          SizedBox(
            height: 15,
          ),
          buildContactBlock(': 02-470-8000', 'assets/images/contact.png'),
          SizedBox(
            height: 17,
          ),
          Container(
            height: 220,
            child: Image.asset('assets/images/test.png'),
          )
        ],
      ),
    );
  }
}
