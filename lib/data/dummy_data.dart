import 'package:flutter/cupertino.dart';

import '../models/annoucement.dart';
import '../models/room.dart';

const DUMMY_ROOM = const [
  Room(
    id: '1',
    title: 'Room #1',
    description: 'This is a first room',
    category: Category.Education,
  ),
  Room(
    id: '2',
    title: 'Room #2',
    description: 'This is a second room',
    category: Category.Show,
  ),
  Room(
    id: '3',
    title: 'Room #3',
    description: 'This is a third room',
    category: Category.Game,
  ),
  Room(
    id: '4',
    title: 'Room #4',
    description: 'This is a fourth room',
    category: Category.Game,
  ),
  Room(
    id: '5',
    title: 'Room #5',
    description: 'This is a fifth room',
    category: Category.Show,
  ),
  Room(
    id: '6',
    title: 'Room #6',
    description: 'This is a sixth room',
    category: Category.Education,
  ),
];

const DUMMY_ANNOUCEMENT = const [
  Annoucement(
    title: 'Emergency',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc fringilla commodo lorem, quis feugiat velit blandit nec. Praesent arcu felis, dictum nec tellus sit amet, sollicitudin congue felis. Quisque condimentum fermentum ante, ac laoreet dolor tristique quis. Donec nec convallis massa. Vivamus risus dolor, suscipit sit amet nisi in, posuere sodales dui.',
  ),
  Annoucement(
    title: 'First',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc fringilla commodo lorem, quis feugiat velit blandit nec. Praesent arcu felis, dictum nec tellus sit amet, sollicitudin congue felis. Quisque condimentum fermentum ante, ac laoreet dolor tristique quis. Donec nec convallis massa. Vivamus risus dolor, suscipit sit amet nisi in, posuere sodales dui.',
  ),
  Annoucement(
    title: 'Second',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc fringilla commodo lorem, quis feugiat velit blandit nec. Praesent arcu felis, dictum nec tellus sit amet, sollicitudin congue felis. Quisque condimentum fermentum ante, ac laoreet dolor tristique quis. Donec nec convallis massa. Vivamus risus dolor, suscipit sit amet nisi in, posuere sodales dui.',
  ),
  Annoucement(
    title: 'Third',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc fringilla commodo lorem, quis feugiat velit blandit nec. Praesent arcu felis, dictum nec tellus sit amet, sollicitudin congue felis. Quisque condimentum fermentum ante, ac laoreet dolor tristique quis. Donec nec convallis massa. Vivamus risus dolor, suscipit sit amet nisi in, posuere sodales dui.',
  ),
];
