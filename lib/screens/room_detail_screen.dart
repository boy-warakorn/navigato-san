import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class RoomDetailScreen extends StatelessWidget {
  static const routeName = '/roomDetail';

  @override
  Widget build(BuildContext context) {
    final roomId = ModalRoute.of(context).settings.arguments as String;
    final selectedRoom =
        DUMMY_ROOM.firstWhere((element) => roomId == element.id);
    final title = selectedRoom.title;
    final description = selectedRoom.description;
   
    print(roomId);

    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text('${title}'),
      ),
      body: Card(
        elevation: 5,
        margin: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 15,
          bottom: 15,
        ),
        color: Colors.orangeAccent,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(),
                  child: Image.asset(
                    'assets/images/dummy2.jpg',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 10,
                  child: Container(
                    margin: EdgeInsets.all(2),
                    padding: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.school,
                          size: 50,
                        ),
                        Text(
                          'Education',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    'Rooms : ${title}',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
              color: Colors.white,
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 200,
                  margin: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Detail :',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 5),
                          child: ListView(
                            children: <Widget>[
                              Text(
                                '${description}',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.favorite),
        onPressed: () {},
        backgroundColor: Colors.deepOrange,
        label: Text('Save'),
      ),
    );
  }
}
