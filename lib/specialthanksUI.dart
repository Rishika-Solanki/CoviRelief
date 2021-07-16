import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:hexagon/hexagon.dart';
import 'package:sizer/sizer.dart';

Widget specialthanksUI(String image, String name,String description) {
  return Container(
    decoration: BoxDecoration(
        color: Color(0xffededed)
    ),
    margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
    padding: EdgeInsets.only(top: 10,bottom: 10),
    width: double.infinity,
    child: Column(
      children: [
        HexagonWidget.flat(
          color: Color(0xffededed),
          width: 90,
          padding: 4.0,
          child:new Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(image)
                  )
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            description=="Head Moderator"?Icon(Icons.star,color: Color(0xffFFD700,),size: 14,):(description=="Sub Moderator"?Icon(Icons.star,color: Color(0xffC0C0C0),):Text("")),
            Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11),textAlign: TextAlign.center,),
          ],
        )
        // SizedBox(height: 3,),
        ,Text(description,style: TextStyle(fontSize: 8),),
      ],
    )
  );
}