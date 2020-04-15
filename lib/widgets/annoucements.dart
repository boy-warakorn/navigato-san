import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../data/dummy_data.dart';
import '../models/annoucement.dart';

class Annoucements extends StatelessWidget {
  final List<Annoucement> annouceData = DUMMY_ANNOUCEMENT;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 5),
      pauseAutoPlayOnTouch: Duration(seconds: 10),
      enlargeCenterPage: true,
      height: 170.0,
      items: annouceData.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            '${i.title} <',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.announcement,
                          color: Colors.blueGrey,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            '>',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          Text(
                            'Details : ${i.description}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
