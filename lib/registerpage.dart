import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'userinfo.dart';
import 'regHomePage.dart';
import 'user_simple_preferences.dart';
import 'utility.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'string_extension.dart';

class registerpage extends StatefulWidget {
  String phnum;
  registerpage({this.phnum});

  @override
  _registerpageState createState() => _registerpageState(phnum: phnum);
}

bool isimg = false;

class _registerpageState extends State<registerpage> {
  String phnum;
  _registerpageState({this.phnum});

  String _fname, _lname;
  String full_name;
  File sampleImage;
  Image image;

  Future getImage() async {
    var tempImage = await ImagePicker().getImage(source: ImageSource.gallery);
    File imageFile = File(tempImage.path);
    setState(() {
      sampleImage = imageFile;
      image = Image.file(sampleImage);
    });
    ImageSharedPrefs.saveImageToPrefs(
        ImageSharedPrefs.base64String(sampleImage.readAsBytesSync()));
  }

  Future<void> uploadStatusImage() async {
    if (true) {
      FirebaseStorage storage = FirebaseStorage.instance;
      final Reference postImageRef = storage.ref().child("Post Images");
      var timeKey = new DateTime.now();
      String xyz = timeKey.toString() + ".jpg";
      final UploadTask uploadTask =
          postImageRef.child(xyz).putFile(sampleImage);
      var imageUrl = await (await uploadTask).ref.getDownloadURL();
      final String url_akshat = imageUrl.toString();
      savetoDatabase(url_akshat);
    }
  }

  @override
  void initState() {
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
        if (phnum == user.phnum) {
          UserSimplePreferences.setphonenumber(phnum);
          UserSimplePreferences.setImageLink(user.image);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => regHomePage()),
          );
        }
      }
    });
    super.initState();
  }

  void savetoDatabase(url) {
    UserSimplePreferences.setImageLink(url);
    UserSimplePreferences.setUserName(full_name);
    UserSimplePreferences.setphonenumber(phnum);
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      "email": '',
      "name": full_name,
      "number_of_posts": 0,
      "phnum": phnum,
      "points": 0,
      "verify": "no",
      "volid": 'test',
      "image": url,
      "order": 9999999,
      "linkedin": '',
      "twitter": '',
      "position": "volunteer",
      "banned": "no"
    };
    ref.child("User-Data").push().set(data);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                      "Register",
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
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 100,
                            backgroundImage: sampleImage == null
                                ? AssetImage("images/nodp.jpg")
                                : FileImage(sampleImage),
                            child: Align(
                              alignment: Alignment.center,
                              child: sampleImage == null
                                  ? IconButton(
                                      iconSize: 45,
                                      color: Colors.black,
                                      icon: Icon(Icons.add_a_photo_rounded),
                                      onPressed: () {
                                        getImage();
                                      },
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "First Name :",
                                style: TextStyle(
                                    fontFamily: "OpenSans", fontSize: 20),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(5),
                                    color: Color(0xffafc9e5)),
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  child: TextField(
                                    keyboardType: TextInputType.name,
                                    onChanged: (value) {
                                      setState(() {
                                        _fname = value.trim();
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                "Last Name :",
                                style: TextStyle(
                                    fontFamily: "OpenSans", fontSize: 20),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xffafc9e5)),
                                child: Container(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: TextField(
                                    keyboardType: TextInputType.name,
                                    onChanged: (value) {
                                      setState(() {
                                        _lname = value.trim();
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.all(12),
                                  width: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF4686c8),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      full_name = _fname.capitalize() +
                                          " " +
                                          _lname.capitalize();
                                      if (image == null || image == "") {
                                        savetoDatabase("");
                                      } else {
                                        uploadStatusImage();
                                      }
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                regHomePage()),
                                      );
                                    },
                                    child: Text(
                                      "Continue",
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontSize: 25,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  )
                ],
              ),
            ),
          )),
    );
    ;
  }
}
