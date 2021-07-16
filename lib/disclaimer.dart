import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:supply19/profile_select.dart';
import 'package:supply19/regHomePage.dart';
import 'package:supply19/user_simple_preferences.dart';
import 'package:swipe_up/swipe_up.dart';
import 'package:sizer/sizer.dart';

import 'HomePage.dart';
import 'modHomePage.dart';

class disclaimer extends StatefulWidget {
  @override
  _disclaimerState createState() => _disclaimerState();
}

class _disclaimerState extends State<disclaimer> {
  String ismoderator = '', isvolunteer = '', isbeneficiary = '';

  @override
  void initState() {
    ismoderator = UserSimplePreferences.getisModerator() ?? '';
    isvolunteer = UserSimplePreferences.getisVolunteer() ?? '';
    isbeneficiary = UserSimplePreferences.getisBenefeciary() ?? '';
    super.initState();
    ismoderator = UserSimplePreferences.getisModerator() ?? '';
    isvolunteer = UserSimplePreferences.getisVolunteer() ?? '';
    isbeneficiary = UserSimplePreferences.getisBenefeciary() ?? '';
  }

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      child:
      return SwipeUp(
        onSwipe: () {
          UserSimplePreferences.setisFirst1("status");
          ismoderator = UserSimplePreferences.getisModerator() ?? '';
          isvolunteer = UserSimplePreferences.getisVolunteer() ?? '';
          isbeneficiary = UserSimplePreferences.getisBenefeciary() ?? '';
          if ((ismoderator == "") &&
              (isvolunteer == "") &&
              (isbeneficiary == "")) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => profile_select()));
          } else if (ismoderator != "") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => modHomePage(
                        selectedItemPosition: 1,
                      )),
            );
          } else if (isvolunteer != "") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => regHomePage()),
            );
          } else if (isbeneficiary != "") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    selectedItemPosition: 2,
                  ),
                ));
          }
        },
        body: Scaffold(
          body: Container(
            padding: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  // const Color(0xFFe7ebed),
                  const Color(0xFF6fcbe2),
                  const Color(0xFF6a95da),
                  const Color(0xFF6863d8),
                ],
                    stops: [
                  0.1,
                  0.5,
                  0.9
                ])),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                      ),
                      Text(
                        "Disclaimer",
                        style: TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Last Updated May 12,2021",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 13,
                            color: Color(0xffd9f6ff)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                  padding: const EdgeInsets.all(3.0),
                  height: 65.h,
                  child: Scrollbar(
                    controller: _scrollController, // <---- Here, the controller
                    isAlwaysShown: true,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 30.0),
                        child: Text(
                          """This app will provide you with verified information of supplies and resources. Although we will maintain these records, to be as accurate as possible, but it is still advised that you trust the information provided on the app, at your own risk. We advise you to take all safety precautions set forth by the Government of India, and respect all the laws and health and safety requirements
                                    
Every information appearing on the app, is strictly monitored by our team of moderators from Pratyek NGO & Bennett University, Greater Noida, India. We are trying to maintain a PAN-India record of all medical supplies, if you are unable to find the resources that you need. You can post a query regarding the same. Our team of moderators will respond to your queries personally by calling the phone number that you provide to us in the query section.""",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "OpenSans",
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Text('Swipe Up', style: TextStyle(color: Colors.white)),
        ),
      );
    });
  }
}
