import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xffededed),
          body: SafeArea(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Text("\nSign-Up",style: TextStyle(fontFamily: "LatoBold",fontSize: 45,color: Color(0xFF09427D)),),
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
                              color: Colors.white
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("To keep the supply updates verified and up-to-date, We are no longer accepting applications sign-ups.\n",style: TextStyle(fontFamily: "OpenSans",fontSize: 20),),
                              Text("If you want to sign-up and help in our cause, you can send an email to us at ",style: TextStyle(fontFamily: "OpenSans",fontSize: 20),),
                              Text("Supply19@gmail.com\n",style: TextStyle(fontFamily: "OpenSans",fontSize: 20,color: Colors.blue),),
                              Text("Your profile and identity will be verified by us before you are allowed to post any updates on the app.",style: TextStyle(fontFamily: "OpenSans",fontSize: 20),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: TextButton(
                          onPressed:(){
                            Navigator.pop(context);
                          },
                          child: Text("Continue to Login",style: TextStyle(color: Color(0xff4686c8),fontFamily: "OpenSans",fontSize: 20),)
                      ),
                    ),
                  )
                ],
              )

          )
      ),
    );;;
  }
}
