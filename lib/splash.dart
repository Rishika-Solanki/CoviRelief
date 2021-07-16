import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:supply19/HomePage.dart';
import 'package:supply19/disclaimer.dart';
import 'package:swipe_up/swipe_up.dart';
import 'package:supply19/login.dart';
import 'profile_select.dart';
import 'user_simple_preferences.dart';
import 'modHomePage.dart';
import 'regHomePage.dart';
import 'package:supply19/profile_select.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  String isFirst1 = '';
  String ismoderator = '', isvolunteer = '', isbeneficiary = '';

  @override
  void initState() {
    isFirst1 = UserSimplePreferences.getisFirst1() ?? '';
    ismoderator = UserSimplePreferences.getisModerator() ?? '';
    isvolunteer = UserSimplePreferences.getisVolunteer() ?? '';
    isbeneficiary = UserSimplePreferences.getisBenefeciary() ?? '';
    super.initState();
    isFirst1 = UserSimplePreferences.getisFirst1() ?? '';
    ismoderator = UserSimplePreferences.getisModerator() ?? '';
    isvolunteer = UserSimplePreferences.getisVolunteer() ?? '';
    isbeneficiary = UserSimplePreferences.getisBenefeciary() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SwipeUp(
      onSwipe: () {
        isFirst1 = UserSimplePreferences.getisFirst1() ?? '';
        ismoderator = UserSimplePreferences.getisModerator() ?? '';
        isvolunteer = UserSimplePreferences.getisVolunteer() ?? '';
        isbeneficiary = UserSimplePreferences.getisBenefeciary() ?? '';
        if (isFirst1 == '') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => disclaimer()));
        } else {
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
        }
      },
      body: Scaffold(
          backgroundColor: Color(0xFFEDEDED),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Lottie.asset('assets/lottie/human.json'),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    "CoviRelief",
                    style: TextStyle(
                        fontFamily: "LatoBold",
                        color: Color(0xFF4686C8),
                        fontWeight: FontWeight.bold,
                        fontSize: 45),
                  )),
              Expanded(
                  child: Text(
                "A volunteer based platform for verified resources",
                style: TextStyle(
                    fontFamily: "HKGrotesk",
                    color: Color(0xFF09427D),
                    fontSize: 20),
                textAlign: TextAlign.center,
              )),
              Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 1,
                  )),
            ],
          )),
      child: Material(
        color: Colors.transparent,
        child: Text('Swipe Up', style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
