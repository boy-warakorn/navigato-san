import 'package:flutter/material.dart';

enum Category {
  Education,
  Game,
  Show,
}

class Room {
  final String id;
  final String title;
  final String description;
  final Category category;
  final String imgPath;
  final String location;

  const Room({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.category,
    @required this.imgPath,
    @required this.location,
  });
}
