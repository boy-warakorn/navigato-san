import 'package:flutter/material.dart';
import '../widgets/faq_item.dart';
import '../screens/contact_screen.dart';

class FAQScreen extends StatelessWidget {
  static const routeName = '/FAQscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'Frequently Ask Questions (FAQ)',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          FAQItem('Lorem ipsum dolor sit amet.', [
            'subTest1.1',
            'subTest1.2',
            'subTest1.3',
          ]),
          FAQItem('Lorem ipsum dolor sit amet.', [
            'subTest2.1',
            'subTest2.2',
            'subTest2.3',
          ]),
          FAQItem('Lorem ipsum dolor sit amet.', [
            'subTest3.1',
            'subTest3.2',
            'subTest3.3',
          ]),
        ],
      ),
    );
  }
}
