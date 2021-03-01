import 'package:Date_Roulette/screens/login_screen.dart';
import 'package:Date_Roulette/screens/main_tab_screen.dart';
import 'package:Date_Roulette/screens/signup_screen.dart';
import 'package:Date_Roulette/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DateRoulette());
}

class DateRoulette extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: WelcomeScreen.id, routes: {
      WelcomeScreen.id: (context) => WelcomeScreen(),
      LoginScreen.id: (context) => LoginScreen(),
      SignupScreen.id: (context) => SignupScreen(),
      MainTabScreen.id: (context) => MainTabScreen(),
    });
  }
}
