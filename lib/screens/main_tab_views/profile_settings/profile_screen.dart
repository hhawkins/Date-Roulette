import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String location;
  int age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                // onChanged: (value) {
                //   email = value;
                // },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'First Name'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                // onChanged: (value) {
                //   email = value;
                // },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Last Name'),
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          )),
    );
  }
}
