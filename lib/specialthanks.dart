import 'package:flutter/material.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:supply19/specialthanksUI.dart';
import 'package:supply19/specialthanksdata.dart';
import 'package:supply19/sponsor.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:supply19/userinfo.dart';
import 'sponsor.dart';
import 'SponsorData.dart';
import 'package:sizer/sizer.dart';

import 'SponsorData.dart';

class specialthanks extends StatefulWidget {
  @override
  _specialthanksState createState() => _specialthanksState();
}

class _specialthanksState extends State<specialthanks> {
  @override
  void initState() {
    FirebaseDatabase.instance
        .reference()
        .child("SpecialThanks")
        .orderByChild("order")
        .onChildAdded
        .listen((event) {
      SpecialThanksData sd = new SpecialThanksData(
        event.snapshot.value['image'],
        event.snapshot.value['name'],
        event.snapshot.value['description'],
        event.snapshot.value['order'],
      );
      ss.add(sd);
      setState(() {});
    });
    super.initState();
  }

  List<SpecialThanksData> ss = [];
  final options = LiveOptions(
    // Start animation after (default zero)
    delay: Duration(seconds: 1),

    // Show each item through (default 250)
    showItemInterval: Duration(milliseconds: 500),

    // Animation duration (default 250)
    showItemDuration: Duration(seconds: 1),

    // Animations starts at 0.05 visible
    // item fraction in sight (default 0.025)
    visibleFraction: 0.05,

    // Repeat the animation of the appearance
    // when scrolling in the opposite direction (default false)
    // To get the effect as in a showcase for ListView, set true
    reAnimateOnVisibility: false,
  );

  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      // For example wrap with fade transition
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        // And slide transition
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          // Paste you Widget
          child: specialthanksUI(
            ss[index].image,
            ss[index].name,
            ss[index].description,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xffededed),
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    color: Color(0xFFBDD4EB),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "SPECIAL THANKS",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF09427d)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: LiveGrid.options(
                      options: options,

                      // Like GridView.builder, but also includes animation property
                      itemBuilder: buildAnimatedItem,

                      // Other properties correspond to the `ListView.builder` / `ListView.separated` widget
                      itemCount: ss.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 100.w < 576 ? 3 : (100.w < 768 ? 4 : 5),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                    ),
                  )
                ],
              ),
            )),
      );
    });
  }
}
