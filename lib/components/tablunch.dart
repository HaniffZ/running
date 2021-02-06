import 'package:flutter/material.dart';
import 'package:running/data/Disheslunch.dart';
import 'package:running/pages/dishes_detail.dart';

import 'image_card_with_basic_footer_dishes.dart';

class TabLunch extends StatelessWidget {
  final String tabName;

  TabLunch({@required this.tabName});

  List<Widget> _renderItemDishes(BuildContext context) {
    List<Widget> list = [];
    int count = 0;
    dishesLunch.forEach((dish) {
      Widget element = Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: GestureDetector(
          child: ImageCardWithBasicFooterDishes(
              dishes: dish, tag: 'imageHeader$count'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return DishesDetail(dishes: dish, tag: 'imageHeader$count');
            }));
          },
        ),
      );
      list.add(element);
      count++;
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: size.width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(219, 228, 255, 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Track My ' + this.tabName,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromRGBO(122, 158, 255, 1.0),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Column(children: this._renderItemDishes(context)),
            )
          ],
        ),
      ),
    );
  }
}
