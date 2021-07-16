import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animator/flutter_animator.dart';


void _launchURL(String a) async {
  if (await canLaunch(a)) {
    await launch(a);
  } else {
    throw 'Could not launch $a';
  }
}

Widget SponsorUI(String image, String info,String link,int order) {
  return order%2==0?FadeInLeft(child:
  FlatButton(
    onPressed: (){
      _launchURL(link);
    },
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white
      ),
      margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
      padding: EdgeInsets.only(top: 10,bottom: 10),
      width: double.infinity,
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 7,),
          CircleAvatar(
            radius: 48,
            backgroundImage: NetworkImage(image),
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Text(info,textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontFamily: "OpenSansLight",color: Colors.black,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    ),
  )
  ):FadeInRight(child: FlatButton(
    onPressed: (){
      _launchURL(link);
    },
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white
      ),
      margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
      padding: EdgeInsets.only(top: 10,bottom: 10),
      width: double.infinity,
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 7,),
          CircleAvatar(
            radius: 48,
            backgroundImage: NetworkImage(image),
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Text(info,textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontFamily: "OpenSansLight",color: Colors.black,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    ),
  ));
}