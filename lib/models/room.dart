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

  const Room({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.category,
  });
}
