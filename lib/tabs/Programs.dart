import 'package:running/components/header.dart';
import 'package:running/components/image_card_with_basic_footer.dart';
import 'package:running/components/section.dart';
import 'package:running/components/image_card_with_internal.dart';
import 'package:running/models/exercise.dart';
import 'package:running/pages/activity_detail.dart';
import 'package:flutter/material.dart';
import 'package:running/pages/abs_detailSoft.dart';
import 'package:running/pages/abs_detailMedium.dart';
import 'package:running/pages/abs_detailCore.dart';

class Programs extends StatelessWidget {
  final List<Exercise> exercises = [
    Exercise(
      image: 'assets/fatburning1.jpg',
      title: 'Fat Burning Routine',
      time: '3 Days a Week',
      difficult: '3 min',
    ),
  ];

  List<Widget> generateList(BuildContext context) {
    List<Widget> list = [];
    int count = 0;
    exercises.forEach((exercise) {
      Widget element = Container(
        margin: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          child: ImageCardWithBasicFooter(
            exercise: exercise,
            tag: 'imageHeader$count',
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return ActivityDetail(
                    exercise: exercise,
                    tag: 'imageHeader$count',
                  );
                },
              ),
            );
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Header(
                  'Routines',
                ),
                Section(
                  title: 'Fat burning',
                  horizontalList: this.generateList(context),
                ),
                Section(
                  title: 'Daily Workout',
                  horizontalList: <Widget>[
                    GestureDetector(
                      child: ImageCardWithInternal(
                        image: 'assets/image-111.jpg',
                        title: 'Soft \nWorkout ',
                        duration: '3 min',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return AbsDetailSoft();
                            },
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      child: ImageCardWithInternal(
                        image: 'assets/GYM.jpg',
                        title: 'Medium \nWorkout',
                        duration: '6 min',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return AbsDetailMedium();
                            },
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      child: ImageCardWithInternal(
                        image: 'assets/image004.jpg',
                        title: 'Core \nWorkout',
                        duration: '9 min',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return AbsDetailCore();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
