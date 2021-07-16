import 'package:flutter/material.dart';

class termandcondition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffededed),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "Terms & Condition",
                    style: TextStyle(
                        color: Color(0xFF09427d),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  )),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Access to and use of this mobile application (“app”) “Supply – 19” is subject  to the following conditions. Please do not use this app unless you agree with these conditions. This app is currently being developed by two undergraduate students Akshat Rastogi and Aryan Solanki and is administrated by the same. Please note that this app is still in the development phase and that the app may not be fully functional at this time. The app is a digital supply crisis prevention tool designed to provide the information about various pandemic necessary supplies. We reserve the right to discontinue or to make partial or complete modifications to this app or to the Conditions of Use and to our General Terms and Conditions. Please note that we may make such changes at our own discretion and without prior announcement. We must therefore ask you, next time you visit this app, to view the conditions again and to note any changes or amendments that may have been made\n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "OpenSansLight", fontSize: 15),
                            )),
                        Text(
                          "Surrender of use and benefit\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF09427d),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            """All details, documents and illustrations published in this app are crowd sourced. We do not take any guarantee about the authenticity of the posts published on “Supply – 19” mobile application. The leads shown in the application are verified by third-party moderators, and we do not guarantee complete authenticity of the posts published on this platform.
We have compiled the detailed information provided ¡n this app from internal and external sources to the best of its knowledge and belief, using professional diligence. We endeavor to expand and update this range of information on an on-going basis. The information in this app is purely for the purpose of providing supply leads in the duration of this pandemic. However, no representation is made or warranty given, either expressly or tacitly, for the completeness or correctness of the information in this app. Please be aware that this information although accurate on the day it was published may no longer be up to date. We therefore recommend that you check any information you obtain from this app prior to using it in whatever form. If you require any advice or help, please contact us directly. Users of this app declare that they agree to access the app and its content at their own risk. Neither the developers nor third parties involved in the writing, production or transmission of this app can be held liable for resulting implications from access or the impossibility of access or from the use or impossibility of use of this app or from the fact that you have relied on information / recommendation given in this app.
\n""",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "OpenSansLight", fontSize: 15),
                          ),
                        ),
                        Text(
                          "Websites of third-party vendors/links\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF09427d),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              """Insofar as this app contains links/references to third-party websites, we do not give approval to their contents. Neither do we accept any responsibility for the availability or the contents of such websites or any liability for damage or injury resulting from the use of such contents, of whatever form. Supply 19 offers no guarantee that pages linked to provide information of consistent quality. Links to websites are provided to users of this app merely for the sake of convenience. Users access such websites at their own risk. The choice of links should in no way restrict users to the linked pages.\n""",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "OpenSansLight", fontSize: 15),
                            )),
                        Text(
                          "Details supplied by yourself\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF09427d),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              """The user of this app is fully responsible for the content and correctness of details he or she sends to us as well as for the non-violation of any third-party rights that may be involved in such details. The user gives his or her consent for us to store such details and to use the same for the purpose of statistical analysis. For this purpose the user grants to us, an irrevocable, worldwide non-exclusive, royalty-free, sub-licensable license to use the pictures including but not limited for the purpose of continuously improving algorithms in the field of supply management and verification. User may or may not give the personal information in the page of “Voluteer Registration”. It is his or her discretion. If, user provides his/her personal information then it will be taken as his agreement to make contact and provide our services / other information.\n""",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "OpenSansLight", fontSize: 15),
                            )),
                        Text(
                          "International users\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF09427d),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "This app is checked, operated and updated by “Supply- 19” in INDIA. We give no guarantee that the details presented in this app are also correct in places outside India. If you call up this app from a place outside India or download contents, please note that it is your own responsibility to ensure that you act in compliance with local legislation applicable in that place. \n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "OpenSansLight", fontSize: 15),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 35,
                width: double.infinity,
                color: Color(0xff09427d),
              )
            ],
          ),
        ),
      ),
    );
  }
}
