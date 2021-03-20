import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title: const Text('Sharing'),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Save'),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          )
        ],
      ),
      body: Center(child: Column()),
    );
  }
}
