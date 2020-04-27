import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class LayoutMapScreen extends StatefulWidget {
  @override
  _LayoutMapScreenState createState() => _LayoutMapScreenState();
}

class _LayoutMapScreenState extends State<LayoutMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              'Layout Map',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              '( You can zoom-in or out in this layout map )',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
            ),
            margin: EdgeInsets.only(
              top: 5,
            ),
            height: 465,
            width: MediaQuery.of(context).size.width,
            child: PhotoView(
              imageProvider: AssetImage(
                'assets/images/layout.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
