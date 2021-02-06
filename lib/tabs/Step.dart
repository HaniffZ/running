import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pedometer/pedometer.dart';

class Stepi extends StatefulWidget {
  @override
  _StepState createState() => _StepState();
}

class _StepState extends State<Stepi> {
  String showStep = "";
  String _km = "Unknown";
  String _calories = "Unknown";

  String _stepCountValue = 'Unknown';
  StreamSubscription<int> _subscription;

  double _number;
  double _convert;
  double _kmx;
  double burnedx;
  double _percent;

  @override
  void initState() {
    super.initState();
    setUpPedometer();
  }

  void setUpPedometer() {
    Pedometer pedometer = new Pedometer();
    _subscription = pedometer.stepCountStream.listen(_onData,
        onError: _onError, onDone: _onDone, cancelOnError: true);
  }

  void _onData(int stepCountValue) async {
    setState(() {
      _stepCountValue = "$stepCountValue";
    });

    var dist = stepCountValue;
    double y = (dist + .0);

    setState(() {
      _number = y;
    });

    var long3 = (_number);
    long3 = num.parse(y.toStringAsFixed(2));
    var long4 = (long3 / 10000);

    int decimals = 1;
    int fac = pow(10, decimals);
    double d = long4;
    d = (d * fac).round() / fac;
    print("d: $d");

    getDistanceRun(_number);

    setState(() {
      _convert = d;
      print(_convert);
    });
  }

  void reset() {
    setState(() {
      int stepCountValue = 0;
      stepCountValue = 0;
      _stepCountValue = "$stepCountValue";
    });
  }

  void _onDone() {}

  void _onError(error) {
    print("Flutter Pedometer Error: $error");
  }

  void getDistanceRun(double _number) {
    var distance = ((_number * 78) / 100000);
    distance = num.parse(distance.toStringAsFixed(2));
    var distancekmx = distance * 34;
    distancekmx = num.parse(distancekmx.toStringAsFixed(2));
    setState(() {
      _km = "$distance";
    });
    setState(() {
      _kmx = num.parse(distancekmx.toStringAsFixed(2));
    });
  }

  void getBurnedRun() {
    setState(() {
      var calories = _kmx;
      _calories = "$calories";
    });
  }

  @override
  Widget build(BuildContext context) {
    getBurnedRun();
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Steps Tracker'),
        backgroundColor: Colors.black54,
      ),
      body: new ListView(
        padding: EdgeInsets.all(5.0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0),
            width: 250,
            height: 250,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xFFA9F5F2), Color(0xFF01DFD7)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(27.0),
                  bottomRight: Radius.circular(27.0),
                  topLeft: Radius.circular(27.0),
                  topRight: Radius.circular(27.0),
                )),
            child: new CircularPercentIndicator(
              radius: 200.0,
              lineWidth: 13.0,
              animation: true,
              center: Container(
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.only(left: 20.0),
                      child: Icon(
                        FontAwesomeIcons.walking,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      child: Text(
                        '$_stepCountValue',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.purpleAccent),
                      ),
                    ),
                  ],
                ),
              ),
              percent: 0.217,
              footer: new Text(
                "Steps:  $_stepCountValue",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.purple),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.purpleAccent,
            ),
          ),
          Divider(
            height: 5.0,
          ),
          Container(
            width: 80,
            height: 100,
            padding: EdgeInsets.only(left: 70.0, top: 10.0, bottom: 10.0),
            color: Colors.transparent,
            child: Row(
              children: <Widget>[
                new Container(
                  child: new Card(
                    child: Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/distance.png"),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      child: Text(
                        "$_km km",
                        textAlign: TextAlign.right,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.0),
                      ),
                    ),
                    color: Colors.white54,
                  ),
                ),
                new Container(
                  child: new Card(
                    child: Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/burned.png"),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    color: Colors.transparent,
                  ),
                ),
                new Container(
                  child: new Card(
                    child: Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/step.png"),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 2.0),
            width: 150,
            height: 30,
            color: Colors.transparent,
            child: Row(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(left: 95.0),
                  child: new Card(
                    child: Container(
                      child: Text(
                        "$_km km",
                        textAlign: TextAlign.right,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.white),
                      ),
                    ),
                    color: Colors.purple,
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: new Card(
                    child: Container(
                      child: Text(
                        "$_calories kCal",
                        textAlign: TextAlign.right,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.white),
                      ),
                    ),
                    color: Colors.red,
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: new Card(
                    child: Container(
                      child: Text(
                        "$_stepCountValue Steps",
                        textAlign: TextAlign.right,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.white),
                      ),
                    ),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
