import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:lottie/lottie.dart';
import 'package:supply19/regHomePage.dart';
import 'package:supply19/user_simple_preferences.dart';

class vetting extends StatefulWidget {
  @override
  _vettingState createState() => _vettingState();
}

class _vettingState extends State<vetting> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        marginDescription:
            EdgeInsets.only(bottom: 20, top: 10, left: 10, right: 10),
        centerWidget: Container(
          height: 180,
          child: Lottie.asset('assets/lottie/a1.json'),
        ),
        title: "Sensitive Duties",
        styleTitle: TextStyle(
            color: Colors.black87,
            fontSize: 35.0,
            fontFamily: "fonts/Lato-Bold.ttf"),
        description:
            """As a volunteer for Supply-19, it is your responsibility to always post relevant and accurate information on the portal. Every information that you post, will be monitored by our team of moderators.\n
Your posts may be responsible, in saving people’s lives. So be as accurate as you can.

Any misuse of your rights as a volunteer will result in strict actions.""",
        styleDescription: TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
            fontFamily: "fonts/Lato-Bold.ttf"),
        // pathImage: "images/photo_eraser.png",
        backgroundColor: Color(0xffededed),
      ),
    );
    slides.add(
      new Slide(
        marginDescription:
            EdgeInsets.only(bottom: 20, top: 10, left: 10, right: 10),
        centerWidget: Container(
          height: 180,
          child: Lottie.asset('assets/lottie/a5.json'),
        ),
        title: "Interaction",
        styleTitle: TextStyle(
            color: Colors.black87,
            fontSize: 35.0,
            fontFamily: "fonts/Lato-Bold.ttf"),
        description:
            """You will soon receive a call from one of our moderators, for identity verification and moderator interaction.
            
You will be briefed about your role in verifying and posting the leads on the platform.

And you can also clarify any doubts that you may have regarding your contributions on Supply-19.
""",
        // pathImage: "images/photo_pencil.png",
        styleDescription: TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
            fontFamily: "fonts/Lato-Bold.ttf"),
        backgroundColor: Color(0xffededed),
      ),
    );
  }

  final _navKey = GlobalKey<NavigatorState>();

  void _navigateToLogin() {
    _navKey.currentState.popUntil((r) => r.isFirst);
    _navKey.currentState.pushReplacement(
        MaterialPageRoute(builder: (context) => regHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navKey,
      home: Scaffold(
        body: new IntroSlider(
          colorSkipBtn: Colors.black87,
          colorDoneBtn: Colors.black87,
          slides: this.slides,
          onDonePress: () {
            UserSimplePreferences.setFirst("status");
            _navigateToLogin();
          },
        ),
      ),
    );
  }
}
