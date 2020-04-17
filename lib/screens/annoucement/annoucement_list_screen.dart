import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/annoucement.dart';

class AnnoucementList extends StatelessWidget {
  static const routeName = '/AnnoucementList';

  final List<Annoucement> annouceData;
  AnnoucementList(this.annouceData);

  Widget buildAnnoucementCard(
    BuildContext context,
    String description,
    String title,
  ) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        color: Colors.orange[200],
        elevation: 9,
        margin: EdgeInsets.only(
          left: 30,
          right: 30,
          top: 10,
          bottom: 10,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            'Title : ${title}',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      FaIcon(
                        FontAwesomeIcons.bullhorn,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  width: double.infinity,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            'Form : CPE department',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Detail :',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 190,
                  width: 420,
                  child: ListView(children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc fringilla commodo lorem, quis feugiat velit blandit nec. Praesent arcu felis, dictum nec tellus sit amet, sollicitudin congue felis. Quisque condimentum fermentum ante, ac laoreet dolor tristique quis. Donec nec convallis massa. Vivamus risus dolor, suscipit sit amet nisi in, posuere sodales dui.',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: Text('Annoucement'),
        ),
        body: Column(
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
            Container(
              height: MediaQuery.of(context).size.height * 0.53,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => buildAnnoucementCard(
                  context,
                  annouceData[index].description,
                  annouceData[index].title,
                ),
                itemCount: annouceData.length,
              ),
            ),
          ],
        ));
  }
}
