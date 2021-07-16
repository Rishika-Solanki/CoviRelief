import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supply19/HomePage.dart';

import 'package:supply19/privacypolicy.dart';
import 'package:supply19/registration.dart';
import 'package:supply19/specialthanks.dart';
import 'package:supply19/sponsor_page.dart';
import 'package:supply19/termandcondition.dart';
import 'user_simple_preferences.dart';
import 'supportus.dart';

class HomepageDrawerScreen extends StatefulWidget {
  @override
  _HomepageDrawerScreenState createState() => _HomepageDrawerScreenState();
}

class _HomepageDrawerScreenState extends State<HomepageDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      selectedItemPosition: 2,
                    )));
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff6dd5ed), Color(0xff2193b0)])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "  SUPPLY - 19",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => registration()));
                          },
                          child: Row(
                            children: [
                              // FaIcon(FontAwesomeIcons.star,size: 25,color: Colors.white,),
                              Text(
                                "Become A Volunteer",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => specialthanks()));
                          },
                          child: Row(
                            children: [
                              // FaIcon(FontAwesomeIcons.star,size: 25,color: Colors.white,),
                              Text(
                                "   Special Thanks",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      FlatButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              // FaIcon(FontAwesomeIcons.star,size: 25,color: Colors.white,),
                              Text(
                                "         Rate Us",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      FlatButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              // Icon(Icons.share_outlined,size: 25,color: Colors.white,),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "  Share App",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => sponsor_page()),
                              );
                            });
                          },
                          child: Row(
                            children: [
                              // Icon(Icons.timeline_outlined,size: 25,color: Colors.white,),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                " Sponsors",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => privacypolicy()));
                          },
                          child: Row(
                            children: [
                              // FaIcon(FontAwesomeIcons.solidHandshake,size: 25,color: Colors.white,),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Privacy Policy",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => termandcondition()));
                          },
                          child: Row(
                            children: [
                              // FaIcon(FontAwesomeIcons.solidHandshake,size: 25,color: Colors.white,),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "        T&C",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
