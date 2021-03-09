import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreferenceScreen extends StatefulWidget {
  static const String id = 'preference_screen';

  @override
  _PreferenceScreenState createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Preferences'),
            actions: <Widget>[
              FlatButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text('Done'),
                shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              )
            ],
          ),
          body: Center(child: Column()),
        ));
  }
}
