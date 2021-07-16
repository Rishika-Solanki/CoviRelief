import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:supply19/HomePage.dart';
import 'package:supply19/citypage.dart';
import 'package:supply19/regTimeline.dart';
import 'city.dart';
import 'package:search_choices/search_choices.dart';
import 'user_simple_preferences.dart';
import 'modHomePage.dart';
import 'regHomePage.dart';
import 'modHomePageTimeline.dart';
import 'package:sizer/sizer.dart';

class chooselocation extends StatefulWidget {
  String backlink;
  // "registration", "moderator", "beneficiary"
  chooselocation({this.backlink});
  @override
  _chooselocationState createState() =>
      _chooselocationState(backlink: backlink);
}

String selected_city = "";
Color btncolor = Color(0xffc6ced2);
String selectedValueSingleDialog = "";

class _chooselocationState extends State<chooselocation> {
  String backlink;
  _chooselocationState({this.backlink});
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            home: SafeArea(
              child: Scaffold(
                backgroundColor: Color(0xffededed),
                body: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 35,
                            color: Colors.blue,
                          ),
                          Text(
                            " Choose Your City",
                            style: TextStyle(fontSize: 100.w<683?23.sp:30, fontFamily: "OpenSans"),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Container(
                        color: Colors.white,
                        child: SearchChoices.single(
                          items: city(),
                          value: selectedValueSingleDialog,
                          hint: "Search for your city",
                          onChanged: (value) {
                            if (value != null) {
                              selected_city = value;
                              UserSimplePreferences.setCity(selected_city);
                              if (backlink == "moderator") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => modHomePageTimeline(
                                        selectedItemPosition: 2,
                                      )),
                                );
                              } else if (backlink == "registration") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => regTimeline(
                                        selectedItemPosition: 2,
                                      )),
                                );
                              } else if (backlink == "beneficiary") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage(
                                        selectedItemPosition: 2,
                                      )),
                                );
                              }
                            }

// selectedValueSingleDialog = value;
                          },
                          isExpanded: true,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: FlatButton(
                                      color: btncolor,
                                      onPressed: () {
                                        selected_city = "Delhi";
                                        UserSimplePreferences.setCity(selected_city);
                                        if (backlink == "moderator") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    modHomePageTimeline(
                                                      selectedItemPosition: 2,
                                                    )),
                                          );
                                        } else if (backlink == "registration") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => regTimeline(
                                                  selectedItemPosition: 2,
                                                )),
                                          );
                                        } else if (backlink == "beneficiary") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                  selectedItemPosition: 2,
                                                )),
                                          );
                                        }
                                      },
                                      child: Text("Delhi")),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Expanded(
                                  child: FlatButton(
                                      color: btncolor,
                                      onPressed: () {
                                        selected_city = "Haryana";
                                        UserSimplePreferences.setCity(selected_city);
                                        if (backlink == "moderator") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    modHomePageTimeline(
                                                      selectedItemPosition: 2,
                                                    )),
                                          );
                                        } else if (backlink == "registration") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => regTimeline(
                                                  selectedItemPosition: 2,
                                                )),
                                          );
                                        } else if (backlink == "beneficiary") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                  selectedItemPosition: 2,
                                                )),
                                          );
                                        }
                                      },
                                      child: Text("Haryana")),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Expanded(
                                  child: FlatButton(
                                      color: btncolor,
                                      onPressed: () {
                                        selected_city = "Chennai";
                                        UserSimplePreferences.setCity(selected_city);
                                        if (backlink == "moderator") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    modHomePageTimeline(
                                                      selectedItemPosition: 2,
                                                    )),
                                          );
                                        } else if (backlink == "registration") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => regTimeline(
                                                  selectedItemPosition: 2,
                                                )),
                                          );
                                        } else if (backlink == "beneficiary") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                  selectedItemPosition: 2,
                                                )),
                                          );
                                        }
                                      },
                                      child: Text("Chennai")),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: FlatButton(
                                        color: btncolor,
                                        onPressed: () {
                                          selected_city = "Mumbai";
                                          UserSimplePreferences.setCity(
                                              selected_city);
                                          if (backlink == "moderator") {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      modHomePageTimeline(
                                                        selectedItemPosition: 2,
                                                      )),
                                            );
                                          } else if (backlink == "registration") {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => regTimeline(
                                                    selectedItemPosition: 2,
                                                  )),
                                            );
                                          } else if (backlink == "beneficiary") {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => HomePage(
                                                    selectedItemPosition: 2,
                                                  )),
                                            );
                                          }
                                        },
                                        child: Text("Mumbai")),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Expanded(
                                    child: FlatButton(
                                        color: btncolor,
                                        onPressed: () {
                                          selected_city = "Kolkata";
                                          UserSimplePreferences.setCity(
                                              selected_city);
                                          if (backlink == "moderator") {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      modHomePageTimeline(
                                                        selectedItemPosition: 2,
                                                      )),
                                            );
                                          } else if (backlink == "registration") {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => regTimeline(
                                                    selectedItemPosition: 2,
                                                  )),
                                            );
                                          } else if (backlink == "beneficiary") {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => HomePage(
                                                    selectedItemPosition: 2,
                                                  )),
                                            );
                                          }
                                        },
                                        child: Text("Kolkata")),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: FlatButton(
                                      color: btncolor,
                                      onPressed: () {
                                        selected_city = "Lucknow";
                                        UserSimplePreferences.setCity(selected_city);
                                        if (backlink == "moderator") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    modHomePageTimeline(
                                                      selectedItemPosition: 2,
                                                    )),
                                          );
                                        } else if (backlink == "registration") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => regTimeline(
                                                  selectedItemPosition: 2,
                                                )),
                                          );
                                        } else if (backlink == "beneficiary") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                  selectedItemPosition: 2,
                                                )),
                                          );
                                        }
                                      },
                                      child: Text("Lucknow",style: TextStyle(fontSize: 13),)),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Expanded(
                                  child: FlatButton(
                                      color: btncolor,
                                      onPressed: () async {
                                        selected_city = "Noida";
                                        await UserSimplePreferences.setCity(
                                            selected_city);
                                        if (backlink == "moderator") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    modHomePageTimeline(
                                                      selectedItemPosition: 2,
                                                    )),
                                          );
                                        } else if (backlink == "registration") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => regTimeline(
                                                  selectedItemPosition: 2,
                                                )),
                                          );
                                        } else if (backlink == "beneficiary") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                  selectedItemPosition: 2,
                                                )),
                                          );
                                        }
                                      },
                                      child: Text("Noida")),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Expanded(
                                  child: FlatButton(
                                      color: btncolor,
                                      onPressed: () {
                                        selected_city = "Gurgaon";
                                        UserSimplePreferences.setCity(selected_city);
                                        if (backlink == "moderator") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    modHomePageTimeline(
                                                      selectedItemPosition: 2,
                                                    )),
                                          );
                                        } else if (backlink == "registration") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => regTimeline(
                                                  selectedItemPosition: 2,
                                                )),
                                          );
                                        } else if (backlink == "beneficiary") {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                  selectedItemPosition: 2,
                                                )),
                                          );
                                        }
                                      },
                                      child: Text("Gurgaon")),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
