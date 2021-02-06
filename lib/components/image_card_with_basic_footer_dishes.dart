import 'package:running/models/dishes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:running/models/exercise.dart';

class ImageCardWithBasicFooterDishes extends StatelessWidget {
  final Dishes dishes;
  final Exercise exercise;
  final String tag;
  final double imageWidth;

  ImageCardWithBasicFooterDishes({
    this.dishes,
    this.exercise,
    this.imageWidth,
    @required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double localWidth = size.width * 0.75;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Hero(
          tag: this.tag,
          child: Container(
            width: this.imageWidth != null ? this.imageWidth : localWidth,
            height: 160.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              image: DecorationImage(
                image: AssetImage(this.dishes.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          width: this.imageWidth != null ? this.imageWidth : localWidth,
          margin: EdgeInsets.only(top: 10.0),
          child: Text(
            this.dishes.title,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        Container(
          width: this.imageWidth != null ? this.imageWidth : localWidth,
          margin: EdgeInsets.only(top: 5.0),
          child: Text(
            '${this.dishes.time}    |    ${this.dishes.difficult}',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
