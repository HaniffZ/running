import 'package:flutter/foundation.dart';

class Dishes {
  final String title,
      time,
      difficult,
      image,
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
      item7,
      item8,
      link;

  Dishes({
    @required this.title,
    @required this.time,
    @required this.difficult,
    @required this.image,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.item6,
    this.item7,
    this.item8,
    this.link,
  });
}
