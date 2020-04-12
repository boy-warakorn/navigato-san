import 'package:flutter/material.dart';

class Room {
  final String id;
  final String title;
  final String description;

  const Room({
    @required this.id,
    @required this.title,
    @required this.description,
  });
}
