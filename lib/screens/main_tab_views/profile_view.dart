import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  static const String id = 'profile_view';

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
          title: Text('⚡️Chat'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Scaffold());
  }
}
