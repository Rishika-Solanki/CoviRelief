import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supply19/user_simple_preferences.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart';
import 'modHomePage.dart';

_makingPhoneCall(callString) async {
  var url = 'tel:' + callString;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class NotVerifiedPostsUI extends StatefulWidget {
  BuildContext context;
  String image;
  String description;
  String date;
  String time;
  String phnum;
  String volname;
  String status;
  String sname;
  String sphnum;
  String pursuit;
  String key1;
  String category;

  NotVerifiedPostsUI(
      this.context,
      this.image,
      this.description,
      this.date,
      this.time,
      this.phnum,
      this.volname,
      this.status,
      this.sname,
      this.sphnum,
      this.pursuit,
      this.key1,
      this.category);
  @override
  _NotVerifiedPostsUIState createState() => _NotVerifiedPostsUIState(
      context,
      image,
      description,
      date,
      time,
      phnum,
      volname,
      status,
      sname,
      sphnum,
      pursuit,
      key1,
      category);
}

class _NotVerifiedPostsUIState extends State<NotVerifiedPostsUI> {
  BuildContext context;
  String image;
  String description;
  String date;
  String time;
  String phnum;
  String volname;
  String status;
  String sname;
  String sphnum;
  String pursuit;
  String key1;
  String category;
  _NotVerifiedPostsUIState(
      this.context,
      this.image,
      this.description,
      this.date,
      this.time,
      this.phnum,
      this.volname,
      this.status,
      this.sname,
      this.sphnum,
      this.pursuit,
      this.key1,
      this.category);

  String _myValue;
  void _showDialog(String key1) {
    _myValue = description;
    var txt = TextEditingController();
    txt.text = description;
    showSlideDialog(
      backgroundColor: Color(0xffededed),
      context: context,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              "Edit Description",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: txt,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: "Add New Description",
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {
                        _myValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () {
                DatabaseReference _ref = FirebaseDatabase.instance.reference();
                _ref.child('Posts').child(key1).update({
                  'description': _myValue,
                });
                setState(() {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    text: "The description has been updated",
                  );
                });
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFBDD4EB)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.save,
                      size: 30,
                    ),
                    Text(
                      "Save Changes",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String verified;
    if (status != "fake") {
      verified = "Verified";
    } else {
      verified = "Not Verified";
    }

    return Column(
      children: [
        Column(
          children: [
            Card(
              elevation: 5.0,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              date,
                              // style: Theme.of(context).textTheme.subtitle,
                              textAlign: TextAlign.center,
                            ),
                            Column(
                              children: (verified == "Not Verified")
                                  ? [
                                      Icon(
                                        Icons.not_interested_rounded,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        verified,
                                        // style: Theme.of(context).textTheme.subtitle,
                                        style: TextStyle(fontSize: 8.0),
                                        textAlign: TextAlign.center,
                                      ),
                                    ]
                                  : [
                                      Icon(
                                        Icons.verified_user,
                                        color: Colors.green,
                                      ),
                                      Text(
                                        verified,
                                        // style: Theme.of(context).textTheme.subtitle,
                                        style: TextStyle(fontSize: 8.0),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                            ),
                            Row(
                              children: [
                                Text(
                                  time,
                                  // style: Theme.of(context).textTheme.subtitle,
                                  textAlign: TextAlign.center,
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      _showDialog(key1);
                                    })
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        (image != null || image == "")
                            ? new Image.network(image, fit: BoxFit.cover)
                            : SizedBox(
                                height: 1.0,
                              ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          description,
                          style: TextStyle(fontSize: 17),
                          // style: Theme.of(context).textTheme.subhead,
                          textAlign: TextAlign.center,
                        ),
                        (sname == null || sname == "")
                            ? SizedBox(
                                height: 1.0,
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 0.0),
                                padding: EdgeInsets.all(0.0),
                                child: Container(
                                  color: Colors.white,
                                  margin: EdgeInsets.only(top: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                            child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "   Supplier Name ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  sname,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        Container(
                          margin: EdgeInsets.only(top: 0.0),
                          padding: EdgeInsets.all(0.0),
                          child: Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 20.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "   Category ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      category,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        (sphnum == null || sphnum == "")
                            ? SizedBox(
                                height: 1.0,
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 0.0),
                                padding: EdgeInsets.all(0.0),
                                child: Container(
                                  color: Colors.white,
                                  margin: EdgeInsets.only(top: 20.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "   Contact No. ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        child: TextButton(
                                          // padding: EdgeInsets.all(0),
                                          onPressed: () {
                                            _makingPhoneCall(sphnum);
                                          },
                                          onLongPress: () {
                                            Clipboard.setData(
                                                ClipboardData(text: sphnum));
                                            Toast.show(
                                                "Copied to Clipboard", context,
                                                duration: Toast.LENGTH_SHORT,
                                                gravity: Toast.BOTTOM);
                                          },
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "+91-" + sphnum,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.blue),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        pursuit != ""
                            ? Text("In Pursuit By $pursuit")
                            : FlatButton(
                                onPressed: () {
                                  var _firebaseRef = FirebaseDatabase()
                                      .reference()
                                      .child('Posts');
                                  _firebaseRef.child(key1).update({
                                    "pursuit":
                                        UserSimplePreferences.getUserName()
                                  });
                                  CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.info,
                                      text:
                                          "You have been assigned this Post for Verification",
                                      onConfirmBtnTap: () {
                                        setState(() {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                        });
                                      });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.done,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Mark in Pursuit")
                                  ],
                                ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0.0),
                    padding: EdgeInsets.all(0.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 0.0),
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 10.0),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "Volunteer :  " + volname,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: TextButton(
                                // padding: EdgeInsets.all(0),
                                onPressed: () {
                                  _makingPhoneCall(phnum);
                                },
                                onLongPress: () {
                                  Clipboard.setData(
                                      ClipboardData(text: sphnum));
                                  Toast.show("Copied to Clipboard", context,
                                      duration: Toast.LENGTH_SHORT,
                                      gravity: Toast.BOTTOM);
                                },
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "+91-" + phnum,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(
          color: Color(0xFF607d8b),
          height: 10.0,
          thickness: 2.0,
          indent: 75,
          endIndent: 75,
        )
      ],
    );
  }
}
