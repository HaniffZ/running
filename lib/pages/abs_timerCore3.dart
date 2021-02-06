import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'dart:ui';
import 'dart:async';

import 'package:running/tabs/tabs.dart';

class AbsTimerCore3 extends StatelessWidget {
  final String image =
      'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F12%2F2014%2F12%2Fbird-dog-plank-400x400.jpg';
  final String tag = 'imageHeader';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: OrientationBuilder(builder: (context, orientation) {
          return (MediaQuery.of(context).orientation ==
                  prefix0.Orientation.portrait)
              ? Portrait(image: this.image, tag: this.tag)
              : Landscape(image: this.image, tag: this.tag);
        }),
      ),
    );
  }
}

class Portrait extends StatelessWidget {
  final String image, tag;

  Portrait({@required this.image, @required this.tag});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Hero(
              tag: this.tag,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: Image.network(
                  this.image,
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
        Container(
          padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
          height: size.height - 270.0,
          width: size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      'Plank Bird Dog',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  Center(
                    child: OtpTimer(),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: size.width - 50.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(232, 242, 248, 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: RaisedButton(
                      child: Text('The End'),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) {
                            return Tabs();
                          }),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Landscape extends StatelessWidget {
  final String image, tag;

  Landscape({@required this.image, @required this.tag});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          child: Image.network(
            this.image,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 40.0,
          left: 40.0,
          child: Text(
            'Plank Bird Dog',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w900,
              color: Colors.grey[500],
            ),
          ),
        ),
        Positioned(
            top: 30.0,
            left: size.width - 60.0,
            child: GestureDetector(
                child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      size: 29.0,
                      color: Colors.grey[600],
                    )),
                onTap: () {
                  Navigator.pop(context);
                })),
        Positioned(
            top: size.height - 80.0,
            left: size.width / 2 - 30.0,
            child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.pause,
                  size: 38.0,
                ))),
        Positioned(
          top: size.height - 80.0,
          left: size.width - 170.0,
          child: Container(
            height: 60.0,
            width: 145.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(360.0),
            ),
            child: Center(
              child: Text(
                'The End',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OtpTimer extends StatefulWidget {
  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 180;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.timer),
        SizedBox(
          width: 10,
        ),
        Text(
          timerText,
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.black87,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
