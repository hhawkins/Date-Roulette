import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class DataInputField extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _DataInputField();
}

class _DataInputField extends State<DataInputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.center,
        onChanged: (value) {
          //email = value;
        },
        decoration:
        kTextFieldDecoration.copyWith(hintText: 'Enter First Name'),
    );
  }

}

class _ProfileScreenState extends State<ProfileScreen> {
  String userInput;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String location;
  int age;
  //shared preferences
  _saveUserInput () async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(userInput, 'userInput');
   // prefs.remove('my_int_key');
  }
  _getUserInput () async {
    final prefs = await SharedPreferences.getInstance();
    final myString = prefs.getString(userInput) ?? '';
    prefs.remove('my_int_key');
  }


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
                _saveUserInput();
            },
            child: Text('Save'),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: Center(
          child: ListView (
          // Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                // child: Container
                child: Text(
                  'First Name',
                  style: TextStyle(fontSize: 16.0,
                    fontFamily: 'MerriweatherBold'
                  ),
                ),
              ),
              //////Inserted Method DataInputField;
              DataInputField(),
              SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                // child: Container
                child: Text(
                  'Last Name',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'MerriweatherBold'
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                // onChanged: (value) {
                //   lastName = value;
                // },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter Last Name'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                // child: Container
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 16.0,fontFamily: 'MerriweatherBold',
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Email'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                // child: Container
                child: Text(
                  'Phone Number',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'MerriweatherBold',
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter Phone Number'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                // child: Container
                child: Text(
                  'Location',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'MerriweatherBold',
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Location'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                // child: Container
                child: Text(
                  'Age',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'MerriweatherBold',
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Age'),
              ),
             // DateTimePicker(),///////////////////////////////////////////////////////////////////////////////////////
            ],
          ),
        ),
      ),
    );
  }
}
