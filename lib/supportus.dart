import 'package:flutter/material.dart';

class support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body:Container(
            // height: 120.0,
            // width: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'images/support.png'),
                fit: BoxFit.fill,
              ),
            ),
          )
          ),
      ),
      );
  }
}
