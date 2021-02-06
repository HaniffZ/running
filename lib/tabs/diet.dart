import 'package:running/components/Header.dart';
import 'package:running/components/tab_view_base.dart';
import 'package:flutter/material.dart';
import 'package:running/components/tabdinner.dart';
import 'package:running/components/tablunch.dart';

class Diet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0.0),
      child: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              flexibleSpace: Header(
                'Diet',
              ),
              bottom: TabBar(
                tabs: <Widget>[
                  Container(
                    height: 30.0,
                    child: Tab(
                      text: 'Breakfast',
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: Tab(
                      text: 'Lunch',
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: Tab(
                      text: 'Dinner',
                    ),
                  ),
                ],
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey[400],
                indicatorWeight: 4.0,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Color.fromRGBO(215, 225, 255, 1.0),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                TabViewBase(
                  tabName: 'Breakfast',
                ),
                TabLunch(
                  tabName: 'Lunch',
                ),
                TabDinner(
                  tabName: 'Dinner',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
