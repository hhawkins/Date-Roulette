import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class DataInputField extends StatefulWidget {

  // ignore: missing_return
  // Widget build(BuildContext context) {
  //   Align(
  //     alignment: Alignment.centerLeft,
  //     // child: Container
  //     child: Text(
  //       'First Name',
  //       style: TextStyle(fontSize: 20.0),
  //     ),
  //   );
  // }

  @override
  State<StatefulWidget> createState() => _dataInputField();
}

class _dataInputField extends State<DataInputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.center,
        onChanged: (value) {
          //email = value;
        },
        decoration:
        kTextFieldDecoration.copyWith(hintText: 'First Name'),
    );
  }

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
        backgroundColor: kButtonPrimaryColor,
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
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                // child: Container
                child: Text(
                  'First Name',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 10.0,
                width: 250.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              DataInputField(),
              SizedBox(
                height: 8.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                // child: Container
                child: Text(
                  'Last Name',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Last Name'),
              ),
              SizedBox(
                height: 8.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                // child: Container
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                // child: Container
                child: Text(
                  'Phone Number',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Phone Number'),
              ),
              SizedBox(
                height: 8.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                // child: Container
                child: Text(
                  'Location',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Location'),
              ),
              SizedBox(
                height: 8.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                // child: Container
                child: Text(
                  'Age',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Age'),
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
