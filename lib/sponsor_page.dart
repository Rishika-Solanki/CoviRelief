import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:supply19/userinfo.dart';
import 'sponsor.dart';
import 'SponsorData.dart';

class sponsor_page extends StatefulWidget {
  @override
  _sponsor_pageState createState() => _sponsor_pageState();
}

class _sponsor_pageState extends State<sponsor_page> {
  List<SponsorData> ss = [];

  @override
  void initState() {
    FirebaseDatabase.instance
        .reference()
        .child("Sponsor")
        .orderByChild("order")
        .onChildAdded
        .listen((event) {
      SponsorData sd = new SponsorData(
        event.snapshot.value['image'],
        event.snapshot.value['link'],
        event.snapshot.value['text'],
        event.snapshot.value['order'],
      );
      ss.add(sd);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              color: Color(0xFFBDD4EB),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "SPONSORS",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF09427d)),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: ss.length,
                  itemBuilder: (context, index) {
                    return SponsorUI(
                      ss[index].image,
                      ss[index].text,
                      ss[index].link,
                      ss[index].order,
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
