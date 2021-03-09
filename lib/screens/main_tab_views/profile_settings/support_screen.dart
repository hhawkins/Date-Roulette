import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  static const String id = 'support_screen';

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Help and Support'),
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
