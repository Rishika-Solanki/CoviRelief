import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supply19/user_simple_preferences.dart';
import 'modHomePage.dart';
import 'notverifiedpostui.dart';
import 'queryuidata.dart';
import 'queryui.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'postui.dart';
import 'Posts.dart';

class moderatorVerify extends StatefulWidget {
  @override
  _moderatorVerifyState createState() => _moderatorVerifyState();
}

class _moderatorVerifyState extends State<moderatorVerify> {
  List<Posts> uq = [];
  List content = [];
  GlobalKey<RefreshIndicatorState> refreshKey;
  @override
  void initState() {
    super.initState();
    refreshKey = GlobalKey<RefreshIndicatorState>();
    FirebaseDatabase.instance
        .reference()
        .child("Posts")
        .orderByChild("order")
        .onChildAdded
        .listen((event) {
      Posts posts = new Posts(
          event.snapshot.value['image'],
          event.snapshot.value['description'],
          event.snapshot.value['date'],
          event.snapshot.value['time'],
          event.snapshot.value['phnum'],
          event.snapshot.value['volname'],
          event.snapshot.value['status'],
          event.snapshot.value['location'],
          event.snapshot.value['category'],
          event.snapshot.value['sname'],
          event.snapshot.value['sphnum'],
          event.snapshot.key,
          event.snapshot.value["pursuit"]);
      if (posts.status == "fake") {
        uq.add(posts);
      }
      setState(() {
        content = [
          RefreshIndicator(
            key: refreshKey,
            onRefresh: () async {
              await refreshList(3);
            },
            child: ListView.builder(
                itemCount: uq.length,
                itemBuilder: (context, index) {
                  return SwipeActionCell(
                    backgroundColor: Color(0xffededed),
                    key: ObjectKey(uq[index]),
                    performsFirstActionWithFullSwipe: true,
                    trailingActions: <SwipeAction>[
                      SwipeAction(
                          title: "NOT VERIFIED",
                          onTap: (CompletionHandler handler) async {
                            await handler(true);
                            var key = uq[index].key;
                            DatabaseReference _ref = FirebaseDatabase.instance
                                .reference()
                                .child('Posts');
                            _ref.child(key).update({
                              'status': "fake not",
                              "volname": "deleted by " +
                                  UserSimplePreferences.getUserName()
                            });
                            uq.removeAt(index);
                            setState(() {});
                          },
                          color: Colors.red),
                    ],
                    leadingActions: [
                      SwipeAction(
                          title: "VERIFIED",
                          onTap: (handler) async {
                            await handler(true);
                            var key = uq[index].key;
                            DatabaseReference _ref =
                                FirebaseDatabase.instance.reference();
                            int current_post_no = (await _ref
                                    .child("current")
                                    .child("post_no")
                                    .once())
                                .value;
                            String phnum = (await _ref
                                    .child("Posts")
                                    .child(key)
                                    .child("phnum")
                                    .once())
                                .value;

                            var dbTimeKey = new DateTime.now();
                            var formatDate = new DateFormat('MMM d, yyyy');
                            var formatTime = new DateFormat('EEEE, hh:mm aaa');

                            String date = formatDate.format(dbTimeKey);
                            String time = formatTime.format(dbTimeKey);
                            print(current_post_no);
                            _ref.child('Posts').child(key).update({
                              'status': "true",
                              "post_num": current_post_no + 1,
                              "order": 9999999 - current_post_no,
                              "date": date,
                              "time": time,
                            });
                            if (phnum == "8433098945") {
                              _ref.child('Posts').child(key).update({
                                'volname': UserSimplePreferences.getUserName(),
                                "phnum": UserSimplePreferences.getphonenumber()
                              });
                            }
                            _ref.child('current').update({
                              'post_no': current_post_no + 1,
                            });

                            uq.removeAt(index);
                            setState(() {});
                          },
                          color: Colors.green),
                    ],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NotVerifiedPostsUI(
                          context,
                          uq[index].image,
                          uq[index].description,
                          uq[index].date,
                          uq[index].time,
                          uq[index].phnum,
                          uq[index].volname,
                          uq[index].status,
                          uq[index].sname,
                          uq[index].sphnum,
                          uq[index].pursuit,
                          uq[index].key,
                          uq[index].categpry),
                    ),
                  );
                }),
          )
        ];
      });
    });
  }

  Future<Null> refreshList(int selected_item) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => modHomePage(selectedItemPosition: 3)),
    );
    await Future.delayed(Duration(seconds: 2));
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xffededed),
          body: RefreshIndicator(
            key: refreshKey,
            onRefresh: () async {
              await refreshList(3);
            },
            child: ListView.builder(
                itemCount: uq.length,
                itemBuilder: (context, index) {
                  return SwipeActionCell(
                    backgroundColor: Color(0xffededed),
                    key: ObjectKey(uq[index]),
                    performsFirstActionWithFullSwipe: true,
                    trailingActions: <SwipeAction>[
                      SwipeAction(
                          title: "NOT VERIFIED",
                          onTap: (CompletionHandler handler) async {
                            await handler(true);
                            var key = uq[index].key;
                            DatabaseReference _ref = FirebaseDatabase.instance
                                .reference()
                                .child('Posts');
                            _ref.child(key).update({
                              'status': "fake not",
                              "volname": "deleted by " +
                                  UserSimplePreferences.getUserName()
                            });
                            uq.removeAt(index);
                            setState(() {});
                          },
                          color: Colors.red),
                    ],
                    leadingActions: [
                      SwipeAction(
                          title: "VERIFIED",
                          onTap: (handler) async {
                            await handler(true);
                            var key = uq[index].key;
                            DatabaseReference _ref =
                                FirebaseDatabase.instance.reference();
                            int current_post_no = (await _ref
                                    .child("current")
                                    .child("post_no")
                                    .once())
                                .value;
                            String phnum = (await _ref
                                    .child("Posts")
                                    .child(key)
                                    .child("phnum")
                                    .once())
                                .value;

                            var dbTimeKey = new DateTime.now();
                            var formatDate = new DateFormat('MMM d, yyyy');
                            var formatTime = new DateFormat('EEEE, hh:mm aaa');

                            String date = formatDate.format(dbTimeKey);
                            String time = formatTime.format(dbTimeKey);
                            print(current_post_no);
                            _ref.child('Posts').child(key).update({
                              'status': "true",
                              "post_num": current_post_no + 1,
                              "order": 9999999 - current_post_no,
                              "date": date,
                              "time": time,
                            });
                            if (phnum == "8433098945") {
                              _ref.child('Posts').child(key).update({
                                'volname': UserSimplePreferences.getUserName(),
                                "phnum": UserSimplePreferences.getphonenumber()
                              });
                            }
                            _ref.child('current').update({
                              'post_no': current_post_no + 1,
                            });

                            uq.removeAt(index);
                            setState(() {});
                          },
                          color: Colors.green),
                    ],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NotVerifiedPostsUI(
                          context,
                          uq[index].image,
                          uq[index].description,
                          uq[index].date,
                          uq[index].time,
                          uq[index].phnum,
                          uq[index].volname,
                          uq[index].status,
                          uq[index].sname,
                          uq[index].sphnum,
                          uq[index].pursuit,
                          uq[index].key,
                          uq[index].categpry),
                    ),
                  );
                }),
          )),
    );
  }
}
