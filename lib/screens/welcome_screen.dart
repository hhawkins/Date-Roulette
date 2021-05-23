import 'dart:io';

import 'package:Date_Roulette/constants.dart';
import 'package:Date_Roulette/screens/main_tab_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:Date_Roulette/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'signup_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = ColorTween(begin: kButtonSecondaryColor, end: kColorWhite)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: animation.value,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0,
                    ),
                  ),
                  TypewriterAnimatedTextKit(
                    text: ['Date Roulette'],
                    textStyle: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      color: kColorBlack,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedButton(
                title: 'Log In',
                color: kButtonPrimaryColor,
                textColor: kColorWhite,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
              RoundedButton(
                title: 'Register',
                color: kButtonSecondaryColor,
                textColor: kColorBlack,
                onPressed: () {
                  Navigator.pushNamed(context, SignupScreen.id);
                },
              ),
              RoundedButton(
                title: 'Guest',
                color: kColorWhite,
                textColor: kColorBlack,
                onPressed: () async {
                  try {
                    final user = await _auth.signInAnonymously();
                    if (user != null) {
                      Navigator.pushNamed(context, MainTabScreen.id);
                    } else {
                      errorDialog(context);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              // RoundedButton(
              //   title: 'Test',
              //   color: kButtonSecondaryColor,
              //   textColor: kColorBlack,
              //   onPressed: () {
              //     errorDialog(context);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void errorDialog(BuildContext context) {
    if (Platform.isIOS) {
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: new Text("Error With Login"),
                content: new Text(
                    "There was an error with the login. Please try again."),
                actions: <Widget>[
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: new Text("Error With Login"),
                content: new Text(
                    "There was an error with the login. Please try again."),
                actions: <Widget>[
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ));
    }
  }
}
