import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supply19/userinfo.dart';
import 'package:url_launcher/url_launcher.dart';

class meet_team extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/meet.png"), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
