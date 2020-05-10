import 'package:flutter/material.dart';
import 'dart:math';

class FAQItem extends StatefulWidget {
  final String title;

  final List subtitle;
  FAQItem(this.title, this.subtitle);
  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: _expanded ? min(widget.subtitle.length * 39.0, 200) + 70 : 70,
      duration: Duration(milliseconds: 300),
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.withOpacity(0.5), width: 2.0),
            borderRadius: BorderRadius.circular(4.0)),
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            AnimatedContainer(
              height: _expanded ? min(widget.subtitle.length * 39.0, 200) : 0,
              duration: Duration(milliseconds: 300),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 4,
                ),
                height: min(widget.subtitle.length * 39.0, 200),
                child: ListView.builder(
                  itemCount: widget.subtitle.length,
                  itemBuilder: (ctx, index) => Container(
                    margin: EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              widget.subtitle[index],
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
