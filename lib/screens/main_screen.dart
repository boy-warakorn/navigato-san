import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';


import '../widgets/map_generate.dart';
import '../screens/annoucement/annoucement_list_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void goAnnoucementList(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(AnnoucementList.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              height: 210,
              child: Image.asset(
                'assets/images/marker.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: <Widget>[
              MapGenerate(),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.34,
            child: Carousel(
              dotSize: 4.0,
              dotSpacing: 10,
              dotColor: Colors.orange,
              dotIncreasedColor: Colors.orange,
              borderRadius: true,
              indicatorBgPadding: 5.0,
              autoplayDuration: Duration(
                seconds: 3,
              ),
              images: [
                AssetImage('assets/images/oro.jpg'),
                AssetImage('assets/images/dummy1.jpg'),
                AssetImage('assets/images/dummy2.jpg'),
                AssetImage('assets/images/dummy3.jpg'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
