import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:supply19/HomePage.dart';
import 'package:supply19/registerpage.dart';
import 'package:quiver/async.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:pinput/pin_put/pin_put_state.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supply19/userinfo.dart';

import 'login.dart';

int _start = 60;
int _current = 60;
bool timer = false;
bool numreq = false;
int count = 0;

class registration extends StatefulWidget {
  @override
  _registrationState createState() => _registrationState();
}

class _registrationState extends State<registration> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: Color(0xffededed),
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  List<Widget> col = [];

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      setState(() {
        timer = false;
        otpsend = true;
      });
      sub.cancel();
    });
  }

  String _name, _number = "", _email = "";
  bool otpsend = false;
  bool numverify = false;
  List<String> modphone = [];

  @override
  void initState() {
    super.initState();
    DatabaseReference postsRef0 =
        FirebaseDatabase.instance.reference().child("User-Data");
    postsRef0.once().then((DataSnapshot snap0) {
      var KEYS0 = snap0.value.keys;
      var DATA0 = snap0.value;

      for (var indivisualKey in KEYS0) {
        UserData user = new UserData(
          DATA0[indivisualKey]['email'],
          DATA0[indivisualKey]['name'],
          DATA0[indivisualKey]['phnum'],
          DATA0[indivisualKey]['verify'],
          DATA0[indivisualKey]['volid'],
          DATA0[indivisualKey]['number_of_posts'],
          DATA0[indivisualKey]['points'],
          DATA0[indivisualKey]['image'],
          DATA0[indivisualKey]['linkedin'],
          DATA0[indivisualKey]['twitter'],
          DATA0[indivisualKey]['position'],
          DATA0[indivisualKey]['backcolor'],
        );
        if (user.verify == "yes") {
          modphone.add(user.phnum);
        }
      }
    });
    col = [
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " Number :",
              style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffededed)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      " +91 -",
                      style: TextStyle(fontSize: 17),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            setState(() {
                              _number = value.trim();
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    ];
  }

  bool isNotModerator(number) {
    for (var i = 0; i < modphone.length; i++) {
      if (modphone[i] == number) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
      },
      child: MaterialApp(
          home: Scaffold(
        key: _scaffoldkey,
        backgroundColor: Color(0xffededed),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              Container(
                margin: EdgeInsets.all(30),
                child: Text(
                  "Registration",
                  style: TextStyle(
                      fontFamily: "LatoBold",
                      fontSize: 45,
                      color: Color(0xFF09427D)),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(children: appendcon()),
                              Row(
                                children: [
                                  otpsend == false
                                      ? TextButton(
                                          onPressed: () {
                                            if (_number == "") {
                                              FocusScope.of(context).unfocus();
                                              _scaffoldkey.currentState
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Provide Number')));
                                            } else if (_current > 0 &&
                                                _current < 60) {
                                              FocusScope.of(context).unfocus();
                                              _scaffoldkey.currentState
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Wait for $_current secs')));
                                            } else {
                                              if (!isNotModerator(_number)) {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                _scaffoldkey.currentState
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            'Already a Moderator')));
                                              } else {
                                                _verifyPhone();
                                                setState(() {
                                                  timer = true;
                                                  numreq = true;
                                                  startTimer();
                                                });
                                              }
                                            }
                                          },
                                          child: Text("Send OTP"),
                                        )
                                      : TextButton(
                                          onPressed: () {
                                            if (_number == "") {
                                              FocusScope.of(context).unfocus();
                                              _scaffoldkey.currentState
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Provide Number')));
                                            } else if (_current > 0 &&
                                                _current < 60) {
                                              FocusScope.of(context).unfocus();
                                              _scaffoldkey.currentState
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Wait for $_current secs')));
                                            } else {
                                              if (!isNotModerator(_number)) {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                _scaffoldkey.currentState
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            'Already a Moderator')));
                                              } else {
                                                setState(() {
                                                  timer = true;
                                                  _current = 60;
                                                  startTimer();
                                                  _verifyPhone();
                                                });
                                              }
                                            }
                                          },
                                          child: Text("Resend OTP"),
                                        ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  timer == true ? Text("$_current") : Text(""),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "  Are you a Moderator?",
                                    style: TextStyle(
                                        fontFamily: "OpenSansLight",
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => login()));
                                      },
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(
                                            fontFamily: "OpenSansLight",
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ],
                          )),
                    ],
                  ))
            ]))),
      )),
    );
  }

  List appendcon() {
    if (numreq == false) {
      return col;
    }
    if (numreq == true && numverify == false && count == 0) {
      count++;
      col.insert(
        1,
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  " OTP :",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              PinPut(
                fieldsCount: 6,
                onSubmit: (pin) async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                            verificationId: _verificationCode, smsCode: pin))
                        .then((value) async {
                      if (value.user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => registerpage(
                                    phnum: _number,
                                  )),
                        );
                      }
                    });
                  } catch (e) {
                    print(e);
                    FocusScope.of(context).unfocus();
                    _scaffoldkey.currentState
                        .showSnackBar(SnackBar(content: Text('Invalid OTP')));
                  }
                },
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                selectedFieldDecoration: _pinPutDecoration,
                followingFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.deepPurpleAccent.withOpacity(.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      return col;
    }
    if (numreq == true && numverify == false && count >= 1) {
      return col;
    }
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91' + _number,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => registerpage(
                            phnum: _number,
                          )),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print("e.message");
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 30));
  }
}
