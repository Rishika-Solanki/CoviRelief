import 'package:flutter/material.dart';

class privacypolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffededed),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(margin: EdgeInsets.only(top: 20,bottom: 10),child: Text("Privacy Policy",style: TextStyle(
                  color: Color(0xFF09427d),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),)),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(padding: EdgeInsets.all(10),child: Text("We are aware that the security of your private information from the use of our App for supply management (“Supply-19”) is an important concern. We take the protection of your personal data very seriously. Therefore, we would like you to know what data we maintain and what data we discard. With this privacy statement, we would like to inform you about our data privacy measures. The constant development of the internet requires occasional adjustments to our privacy statement. We retain the right to make changes when necessary.\n",textAlign: TextAlign.center,style: TextStyle(fontFamily: "OpenSansLight",fontSize: 15),)),
                        Text("Collection and Processing of Personal Data\n",textAlign: TextAlign.center,style: TextStyle(
                            color: Color(0xFF09427d),
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(""""If you send us data of your personal information, that data will be transferred to us, which may contain the following information: your name / Address / Contact Number etc.
Your personal data may be passed on by us or by our 1agents for use by third parties but only if the use of the data is restricted to the purpose of helping the user with his/her supply needs. We will retain control of and responsibility for the use of any personal data you disclose to us.
\n""",textAlign: TextAlign.center,style: TextStyle(fontFamily: "OpenSansLight",fontSize: 15),),
                        ),
                        Text("Purposes of Use\n",textAlign: TextAlign.center,style: TextStyle(
                            color: Color(0xFF09427d),
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),),
                        Container(padding:EdgeInsets.all(10),child: Text("The data we collect will only be processed for the purpose of enabling the user to access help in finding the supplies, that the user has requested from the application. The data for application moderators and volunteers may be used for analysis and speculatory purpose.\n",textAlign: TextAlign.center,style: TextStyle(fontFamily: "OpenSansLight",fontSize: 15),)),
                        Text("Data Retention\n",textAlign: TextAlign.center,style: TextStyle(
                            color: Color(0xFF09427d),
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),),
                        Container(padding:EdgeInsets.all(10),child: Text("We only retain personal data for as long as is necessary for us to render the service you have re-quested or to which you have given your consent, except where otherwise provided by law.\n",textAlign: TextAlign.center,style: TextStyle(fontFamily: "OpenSansLight",fontSize: 15),)),
                        Text("Security\n",textAlign: TextAlign.center,style: TextStyle(
                            color: Color(0xFF09427d),
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),),
                        Container(padding:EdgeInsets.all(10),child: Text("We use technical and organizational security precautions to protect your data from manipulation, loss, destruction or access by unauthorized persons. Any personal data that is provided to us by the user will be encrypted in transit to prevent its possible misuse by third parties. Our security procedures are continuously revised based on new technological developments.\n",textAlign: TextAlign.center,style: TextStyle(fontFamily: "OpenSansLight",fontSize: 15),)),
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
