import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../constants.dart';

class SupportScreen extends StatefulWidget {
  static const String id = 'support_screen';

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences'),
        backgroundColor: kButtonPrimaryColor,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(LineAwesomeIcons.chevron_circle_left),
              iconSize: 40,
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'back to menu',
            );
          },
        ),
        actions: [
          IconButton(
              icon: Icon(LineAwesomeIcons.save),
              iconSize: 30,
              tooltip: 'back to menu',
              onPressed: () {
                Navigator.pop(context);
              }),
          // CircleBorder(side: BorderSide(color: Colors.transparent)),
        ],
      ),
      body: Center(child: Column()),
    );
  }
}
