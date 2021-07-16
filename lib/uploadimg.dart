import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supply19/modHomePage.dart';
import 'package:supply19/regHomePage.dart';
import 'package:supply19/user_simple_preferences.dart';
import 'HomePage.dart';
import 'dart:io';
import 'main.dart';
import 'city.dart';
import 'package:search_choices/search_choices.dart';
import 'package:cool_alert/cool_alert.dart';
import 'userinfo.dart';

class UploadPhotoPage extends StatefulWidget {
  @override
  _UploadPhotoPageState createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String selected_city = "";
  String selected_item = "";
  String selectedValueSingleDialog = "";
  List<Widget> col = [];
  String sname = '';
  String sphnum = '';
  int current_post_number;
  int user_current_posts;

  void savetoDatabase(url) {
    if (validateAndSave()) {
      var dbTimeKey = new DateTime.now();
      var formatDate = new DateFormat('MMM d, yyyy');
      var formatTime = new DateFormat('EEEE, hh:mm aaa');

      String date = formatDate.format(dbTimeKey);
      String time = formatTime.format(dbTimeKey);

      DatabaseReference ref = FirebaseDatabase.instance.reference();
      String vef;
      if (UserSimplePreferences.getVerifyStatus() == "yes") {
        vef = "true";
      } else {
        vef = "fake";
      }

      var data = {
        "category": selected_item,
        "date": date,
        "description": _myValue,
        "image": url,
        "location": selected_city,
        "phnum": UserSimplePreferences.getphonenumber(),
        "status": vef,
        "sphnum": sphnum,
        "sname": sname,
        "time": time,
        "volname": UserSimplePreferences.getUserName(),
        "post_num": current_post_number,
        "order": (9999999 - current_post_number),
        "backcolor": "FFFFFF",
        "pursuit": ""
      };

      int newx = current_post_number + 1;

      ref.child("current").update({'post_no': newx});

      DatabaseReference _ref =
          FirebaseDatabase.instance.reference().child('User-Data');
      int newposts = user_current_posts + 1;
      _ref.child(currentUserKey).update({'number_of_posts': newposts});

      ref.child("Posts").push().set(data);

      if (vef == "true") {
        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
            builder: (context) => new modHomePage(
              selectedItemPosition: 1,
            ),
          ),
        );
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "Your post was successful",
        );
      } else {
        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
            builder: (context) => new regHomePage(),
          ),
        );
        CoolAlert.show(
          context: context,
          type: CoolAlertType.warning,
          text:
              "Your post will be verified by our moderators before appearing on the timeline",
        );
      }
    }
  }

  void goToHomePage() {
    Navigator.pop(context);
  }

  bool validateAndSave() {
    final form = formkey.currentState;
    if (ban != "yes") {
      if (form.validate()) {
        form.save();

        return true;
      } else {
        return false;
      }
    } else {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "You have been banned from posting leads on our platform",
      );
      return false;
    }
  }

  var currentUserKey;
  var ban;

  Future<void> uploadStatusImage() async {
    if (validateAndSave()) {
      FirebaseStorage storage = FirebaseStorage.instance;
      final Reference postImageRef = storage.ref().child("Post Images");
      var timeKey = new DateTime.now();
      String xyz = timeKey.toString() + ".jpg";
      final UploadTask uploadTask =
          postImageRef.child(xyz).putFile(sampleImage);
      var imageUrl = await (await uploadTask).ref.getDownloadURL();
      final String url_akshat = imageUrl.toString();
      savetoDatabase(url_akshat);
      // goToHomePage();
    }
  }

  List<DropdownMenuItem> categoriesList = [];

  List<DropdownMenuItem> items() {
    return categoriesList;
  }

  @override
  void initState() {
    super.initState();

    FirebaseDatabase.instance
        .reference()
        .child("Category")
        .onChildAdded
        .listen((event) {
      categoriesList.add(
        DropdownMenuItem(
          child: Text(event.snapshot.value["name"]),
          value: event.snapshot.value["name"],
        ),
      );
      setState(() {
        col = [
          Text(
            "Location*",
            style: TextStyle(fontFamily: "OpenSans", fontSize: 18),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            color: Color(0xffa7c2de),
            child: SearchChoices.single(
              items: city(),
              value: selectedValueSingleDialog,
              hint: "Search for your city",
              onChanged: (value) {
                if (value != null) {
                  selected_city = value;
                }
              },
              isExpanded: true,
            ),
          ),
          Text(
            "Select Lead Category*",
            style: TextStyle(fontFamily: "OpenSans", fontSize: 18),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            color: Color(0xffa7c2de),
            child: SearchChoices.single(
              items: categoriesList,
              value: selectedValueSingleDialog,
              hint: "Choose Categories",
              onChanged: (value) {
                if (value != null) {
                  selected_item = value;
                }
              },
              isExpanded: true,
            ),
          ),
          Text(
            "Lead Contact Name",
            style: TextStyle(fontFamily: "OpenSans", fontSize: 18),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(5),
                color: Color(0xffafc9e5)),
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: TextField(
                decoration: InputDecoration(hintText: "(Optional)"),
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  setState(() {
                    sname = value.trim();
                  });
                },
              ),
            ),
          ),
          Text(
            "Lead Contact Number",
            style: TextStyle(fontFamily: "OpenSans", fontSize: 18),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffafc9e5)),
            child: Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Text(
                      " +91 - ",
                      style: TextStyle(fontSize: 17),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(hintText: "(Optional)"),
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          setState(() {
                            sphnum = value.trim();
                          });
                        },
                      ),
                    ),
                  ],
                )),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Description*'),
            validator: (value) {
              return value.isEmpty ? 'Description is empty' : null;
            },
            onSaved: (value) {
              return _myValue = value;
            },
          ),
        ];
      });
    });

    // User ke current number of posts {
    FirebaseDatabase.instance
        .reference()
        .child("User-Data")
        .orderByChild("order")
        .onChildAdded
        .listen((event) {
      UserData ud = new UserData(
        event.snapshot.value['email'],
        event.snapshot.value['name'],
        event.snapshot.value['phnum'],
        event.snapshot.value['verify'],
        event.snapshot.value['volid'],
        event.snapshot.value['number_of_posts'],
        event.snapshot.value['points'],
        event.snapshot.value['image'],
        event.snapshot.value['linkedin'],
        event.snapshot.value['twitter'],
        event.snapshot.value['position'],
        event.snapshot.value['backcolor'],
      );
      if (UserSimplePreferences.getphonenumber() == ud.phnum) {
        user_current_posts = ud.number_of_posts;
        currentUserKey = event.snapshot.key;
        ban = event.snapshot.value['banned'];
      }
    });

    // User ke current number of posts }

    DatabaseReference ref0 = FirebaseDatabase.instance.reference();
    ref0.once().then((DataSnapshot snap1) {
      var KEYS1 = snap1.value.keys;
      var DATA1 = snap1.value;

      for (var indivisualKey in KEYS1) {
        current_post_number = DATA1["current"]['post_no'];
        break;
      }
    });

    Future<void> uploadStatusImage() async {
      if (validateAndSave()) {
        FirebaseStorage storage = FirebaseStorage.instance;
        final Reference postImageRef = storage.ref().child("Post Images");
        var timeKey = new DateTime.now();
        String xyz = timeKey.toString() + ".jpg";
        final UploadTask uploadTask =
            postImageRef.child(xyz).putFile(sampleImage);
        var imageUrl = await (await uploadTask).ref.getDownloadURL();
        final String url_akshat = imageUrl.toString();
        savetoDatabase(url_akshat);
        // goToHomePage();
      }
    }

    col = [
      Text(
        "Location*",
        style: TextStyle(fontFamily: "OpenSans", fontSize: 18),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        color: Color(0xffa7c2de),
        child: SearchChoices.single(
          items: city(),
          value: selectedValueSingleDialog,
          hint: "Search for your city",
          onChanged: (value) {
            if (value != null) {
              selected_city = value;
            }
          },
          isExpanded: true,
        ),
      ),
      Text(
        "Select Lead Category*",
        style: TextStyle(fontFamily: "OpenSans", fontSize: 18),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        color: Color(0xffa7c2de),
        child: SearchChoices.single(
          items: categoriesList,
          value: selectedValueSingleDialog,
          hint: "Choose Categories",
          onChanged: (value) {
            if (value != null) {
              selected_item = value;
            }
          },
          isExpanded: true,
        ),
      ),
      Text(
        "Lead Contact Name",
        style: TextStyle(fontFamily: "OpenSans", fontSize: 18),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(5),
            color: Color(0xffafc9e5)),
        child: Container(
          margin: EdgeInsets.only(left: 10.0),
          child: TextField(
            decoration: InputDecoration(hintText: "(Optional)"),
            keyboardType: TextInputType.name,
            onChanged: (value) {
              setState(() {
                sname = value.trim();
              });
            },
          ),
        ),
      ),
      Text(
        "Lead Contact Number",
        style: TextStyle(fontFamily: "OpenSans", fontSize: 18),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Color(0xffafc9e5)),
        child: Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(
                  " +91 - ",
                  style: TextStyle(fontSize: 17),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: "(Optional)"),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        sphnum = value.trim();
                      });
                    },
                  ),
                ),
              ],
            )),
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Description*'),
        validator: (value) {
          return value.isEmpty ? 'Description is empty' : null;
        },
        onSaved: (value) {
          return _myValue = value;
        },
      ),
    ];
  }

  File sampleImage;
  String _myValue;

  String url_lol = "lol";
  final formkey = new GlobalKey<FormState>();

  Future getImage() async {
    var tempImage = await ImagePicker().getImage(source: ImageSource.gallery);
    File imageFile = File(tempImage.path);
    setState(() {
      sampleImage = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldkey,
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 25),
                    color: Color(0xFFBDD4EB),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "   Add Post",
                          style: TextStyle(
                              color: Color(0xFF09427d),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.done),
                          onPressed: () {
                            if (selected_city == "" || selected_item == "") {
                              FocusScope.of(context).unfocus();
                              _scaffoldkey.currentState.showSnackBar(
                                  SnackBar(content: Text('Fill All Details')));
                            } else {
                              if (validateAndSave()) {
                                if (sampleImage == null) {
                                  validateAndSave();
                                  savetoDatabase('');
                                } else {
                                  uploadStatusImage();
                                }
                              }
                            }
                            // validateAndSave();
                          },
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: col_append(),
                      ),
                    ),
                  )
                ],
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (sampleImage != null) {
              col.removeAt(0);
            }
            getImage();
          },
          tooltip: 'Add Image',
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }

  List col_append() {
    if (sampleImage == null) {
      return col;
    } else {
      col.insert(
        0,
        Image.file(
          sampleImage,
          height: 330.0,
          width: 660.0,
        ),
      );
      return col;
    }
  }
}
