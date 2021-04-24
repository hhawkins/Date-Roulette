import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../constants.dart';

class SharingScreen extends StatefulWidget {
  static const String id = 'sharing_screen';

  @override
  _SharingScreenState createState() => _SharingScreenState();
}

class _SharingScreenState extends State<SharingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invite Friends'),
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
