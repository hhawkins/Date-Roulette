import 'package:Date_Roulette/screens/login_screen.dart';
import 'package:Date_Roulette/screens/main_tab_screen.dart';
import 'package:Date_Roulette/screens/signup_screen.dart';
import 'package:Date_Roulette/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DateRoulette());
}

class DateRoulette extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return LoadingOrErrorScreen();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return DateRouletteApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return LoadingOrErrorScreen();
      },
    );
  }
}

class DateRouletteApp extends StatelessWidget {
  const DateRouletteApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kColorWhite,
          primaryColor: kButtonPrimaryColor,
          accentColor: Color.fromRGBO(0, 0, 0, 80), //kButtonSecondaryColor,
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          MainTabScreen.id: (context) => MainTabScreen(),
        });
  }
}

class LoadingOrErrorScreen extends StatelessWidget {
  const LoadingOrErrorScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold());
  }
}
