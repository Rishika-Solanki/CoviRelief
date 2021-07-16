import 'package:flutter/material.dart';
import 'package:supply19/HomePage.dart';
import 'package:supply19/chooselocation.dart';
import 'package:supply19/citypage.dart';
import 'package:supply19/disclaimer.dart';
import 'package:supply19/meet_team.dart';
import 'package:supply19/privacypolicy.dart';
import 'package:supply19/profile.dart';
import 'package:supply19/registerpage.dart';
import 'package:supply19/registration.dart';
import 'package:supply19/specialthanks.dart';
import 'package:supply19/sponsor_page.dart';
import 'package:supply19/supportus.dart';
import 'package:supply19/uploadimg.dart';
import 'package:supply19/vetting.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'splash.dart';
import 'profile_select.dart';
import 'package:supply19/signup.dart';
import 'HomePage.dart';
import 'modHomePage.dart';
import 'user_simple_preferences.dart';
import 'termandcondition.dart';
import 'regHomePage.dart';
import 'regTimeline.dart';
import 'modHomePageTimeline.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserSimplePreferences.init();
  await UserSimplePreferences.setCategory('');
  await UserSimplePreferences.setCity('');
  runApp(my());
}

class my extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => splash(),
        '/profile_select': (context) => profile_select(),
        '/profile': (context) => profile(),
        '/login': (context) => login(),
        '/homepage': (context) => HomePage(),
        '/homepage2': (context) => modHomePage(),
        '/modtimeline': (context) => modHomePageTimeline(),
        '/homepage3': (context) => regHomePage(),
        '/regtimeline': (context) => regTimeline(),
        '/signup': (context) => signup(),
        '/citypage': (context) => citypage(),
        '/registration': (context) => registration(),
        '/registerpage': (context) => registerpage(),
        '/termandcondition': (context) => termandcondition(),
        '/privacypolicy': (context) => privacypolicy(),
      },
    );
  }
}
