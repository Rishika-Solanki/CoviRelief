import 'package:flutter/material.dart';
import 'package:supply19/HomePage.dart';
import 'package:sizer/sizer.dart';

import 'registration.dart';

class profile_select extends StatefulWidget {
  @override
  _profile_selectState createState() => _profile_selectState();
}

class _profile_selectState extends State<profile_select> {
  int gv1 = 0;
  int gv2 = 0;
  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            backgroundColor: Color(0xFFEDEDED),
            body: SafeArea(
              child: Container(
                margin: 100.w<411?EdgeInsets.symmetric(horizontal: 6.w):EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100.h<683?3.h:30,),
                    Expanded(
                        flex: 1,
                        child: 100.h<683?Text(
                  "Select Profile",
                  style: TextStyle(
                      fontSize: 33,
                      fontFamily: "LatoBold",
                      color: Color(0xFF4686C8)),
                ):Text(
              "Select Profile",
              style: TextStyle(
                  fontSize: 37,
                  fontFamily: "LatoBold",
                  color: Color(0xFF4686C8)),
            )),
                    Expanded(
                      flex: 100.h<683?6:4,
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 100.w<411?1.1:1.3,
                                  child: Radio(
                                      value: 1,
                                      groupValue: gv1,
                                      onChanged: (val) {
                                        setState(() {
                                          gv1 = 1;
                                          gv2 = 0;
                                        });
                                      }),
                                ),
                                100.w<411?Text(
                                  "Volunteer",
                                  style:
                                  TextStyle(fontSize: 20.sp, fontFamily: "OpenSans"),
                                ):Text(
                                  "Volunteer",
                                  style:
                                  TextStyle(fontSize: 24, fontFamily: "OpenSans"),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 100.h<683?1.h:5,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 50),
                                child: 100.h<683?Text(
                                  "You want to help other people during this pandemic, by providing verified sources of medical suppliers, life-saving drugs, injections etc.",
                                  style:
                                  TextStyle(fontFamily: "OpenSans", fontSize: 14.sp),
                                ):Text(
                                  "You want to help other people during this pandemic, by providing verified sources of medical suppliers, life-saving drugs, injections etc.",
                                  style:
                                  TextStyle(fontFamily: "OpenSans", fontSize: 15),
                                )),
                            SizedBox(
                              height: 100.h<683?5.h:50,
                            ),
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 100.w<411?1.1:1.3,
                                  child: Radio(
                                      value: 1,
                                      groupValue: gv2,
                                      onChanged: (val) {
                                        setState(() {
                                          gv2 = 1;
                                          gv1 = 0;
                                        });
                                      }),
                                ),
                                100.w<411?Text(
                                  "Beneficiary",
                                  style:
                                  TextStyle(fontSize: 20.sp, fontFamily: "OpenSans"),
                                ):Text(
                                  "Beneficiary",
                                  style:
                                  TextStyle(fontSize: 24, fontFamily: "OpenSans"),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 50),
                                child: 100.h<683?Text(
                                  "You are facing difficulties, in finding medical supplies for yourself, or for your loved ones.You will be able to see the latest medical supply updates in your area.",
                                  style:
                                  TextStyle(fontFamily: "OpenSans", fontSize: 14.sp),
                                ):Text(
                                  "You are facing difficulties, in finding medical supplies for yourself, or for your loved ones.You will be able to see the latest medical supply updates in your area.",
                                  style:
                                  TextStyle(fontFamily: "OpenSans", fontSize: 15),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: FlatButton(
                        height: 8.h,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color(0xFF4686C8),
                        onPressed: () {
                          print(100.h);
                          print(100.w);
                          if (gv1 == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => registration()));
                          } else if (gv2 == 1) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                    selectedItemPosition: 2,
                                  )),
                            );
                          }
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "OpenSans"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );




  }
}
