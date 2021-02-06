import 'package:flutter/material.dart';
import 'package:running/tabs/Diet.dart';
import 'package:running/tabs/Programs.dart';
import 'package:running/tabs/Step.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          children: <Widget>[
            Programs(),
            Stepi(),
            Diet(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.fitness_center, size: 26.0),
            ),
            Tab(
              icon: Icon(Icons.directions_run, size: 26.0),
            ),
            Tab(
              icon: Icon(Icons.restaurant_menu, size: 26.0),
            ),
          ],
          labelPadding: EdgeInsets.all(5.0),
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black12,
          indicatorWeight: 0.01,
        ),
      ),
    );
  }
}
