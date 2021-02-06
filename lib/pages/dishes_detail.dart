import 'package:running/models/dishes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DishesDetail extends StatelessWidget {
  final String tag;
  final Dishes dishes;

  DishesDetail({
    @required this.dishes,
    @required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Hero(
                    tag: this.tag,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 270,
                      child: Image.asset(
                        this.dishes.image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 20,
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(0, 0, 0, 0.7),
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          this.dishes.title,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          height: 90.0,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(231, 241, 255, 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 55.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Time',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.blueGrey[300]),
                                    ),
                                    Text(
                                      '${this.dishes.time}',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.lightBlue,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 45.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Calories',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.blueGrey[300],
                                      ),
                                    ),
                                    Text(
                                      this.dishes.difficult,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.lightBlue,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text("Menu"),
                        Container(
                          margin: EdgeInsets.only(top: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                this.dishes.item1,
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Text(
                                this.dishes.item2,
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Text(
                                this.dishes.item3,
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Text(
                                this.dishes.item4,
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Text(
                                this.dishes.item5,
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Text(
                                this.dishes.item6,
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Text(
                                this.dishes.item7,
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Text(
                                this.dishes.item8,
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          child: Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(100, 140, 255, 1.0),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(100, 140, 255, 0.5),
                    blurRadius: 10.0,
                    offset: Offset(0.0, 5.0),
                  ),
                ]),
            child: Text(
              'Recipe Video',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          onTap: () => launch(
            this.dishes.link,
          ),
        ));
  }
}
