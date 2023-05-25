import 'package:flutter/material.dart';
import 'package:venue_match/constant.dart';
import 'package:venue_match/widgets/custom_button.dart';

import 'auth/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  // WelcomeScreen({Key? key}) : super(key: key);

  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        //safearea chaii status bar vanda ta;a aaos vanera
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            //column dexa kina vanye sab widgets haru column ma rakhni ho
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight / 20),
                child: const Text(
                  "Sign in and plan your trip",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                  "By continuing, you accept our Terms of Use and Privacy Statement",
                  style: TextStyle(fontSize: 15)),
              const SizedBox(
                //gap haneko
                height: 50,
              ),
              // InkWell(
              //     onTap: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => LoginScreen()));
              //     },
              CustomButton(
                screenWidth: screenWidth,
                label: "Log in",
                backgroundColor: primary,
                textColor: Colors.white,
              ),
              const SizedBox(
                //gap haneko
                height: 50,
              ),
              const Align(child: const Text("Don't you have an account?")),
              const Align(
                  child: const Text(
                      "Register in a convenient way")), //text lai bich ma lana xa vanye text ma click garni ani wrap with widget garera ani align ko code use garni
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: CustomButton(
                    screenWidth: screenWidth,
                    label: "Register with email",
                    textColor: primary,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
