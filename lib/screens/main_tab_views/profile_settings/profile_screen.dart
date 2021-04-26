import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

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
      decoration: kTextFieldDecoration.copyWith(hintText: 'Enter First Name'),
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
  bool showPassword = false; // New password viewer

  /////////////////////////////////
  //Working to save data
  ////////////////////////////////

  void Function(String) onChanged;
  //shared preferences
  _saveUserInput() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(userInput, 'userInput');
    // prefs.remove('my_int_key');
  }

  _getUserInput() async {
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
                _saveUserInput();
              }),
          // CircleBorder(side: BorderSide(color: Colors.transparent)),
        ],
      ),

      /////////////////////////////////////////////////////////////////////////
      //Start of New Edit Profile UI
      ////////////////////////////////////////////////////////////////////////

      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/John Jacobs.PNG')),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Full Name", "John Jacobs", false),
              buildTextField("E-mail", "JJacobs@gmail.com", false),
              buildTextField("Password", "********", true),
              buildTextField("Location", "Current Location", false),
              ////////////////////////////////////////additional buildTextField
              buildTextField("Date of Birth", "09/17/1974", false),
              buildTextField("Phone", "757-789-1364", false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: kButtonPrimaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      LineAwesomeIcons.eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kButtonPrimaryColor,
            )),
      ),
    );
  }
}

// body: Padding(
//   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
//   child: Center(
//     child: ListView(
//       // Column(
//       children: <Widget>[
//         Align(
//           alignment: Alignment.centerLeft,
//           // child: Container
//           child: Text(
//             'First Name',
//             style:
//                 TextStyle(fontSize: 16.0, fontFamily: 'MerriweatherBold'),
//           ),
//         ),
//         //////Inserted Method DataInputField;
//         DataInputField(),
//         SizedBox(
//           height: 20.0,
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           // child: Container
//           child: Text(
//             'Last Name',
//             style:
//                 TextStyle(fontSize: 16.0, fontFamily: 'MerriweatherBold'),
//           ),
//         ),
//         TextField(
//           keyboardType: TextInputType.emailAddress,
//           textAlign: TextAlign.center,
//           // onChanged: (value) {
//           //   lastName = value;
//           // },
//           decoration:
//               kTextFieldDecoration.copyWith(hintText: 'Enter Last Name'),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           // child: Container
//           child: Text(
//             'Email',
//             style: TextStyle(
//               fontSize: 16.0,
//               fontFamily: 'MerriweatherBold',
//             ),
//           ),
//         ),
//         TextField(
//           keyboardType: TextInputType.emailAddress,
//           textAlign: TextAlign.center,
//           onChanged: (value) {
//             email = value;
//           },
//           decoration:
//               kTextFieldDecoration.copyWith(hintText: 'Enter Email'),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           // child: Container
//           child: Text(
//             'Phone Number',
//             style: TextStyle(
//               fontSize: 16.0,
//               fontFamily: 'MerriweatherBold',
//             ),
//           ),
//         ),
//         TextField(
//           keyboardType: TextInputType.emailAddress,
//           textAlign: TextAlign.center,
//           onChanged: (value) {
//             email = value;
//           },
//           decoration: kTextFieldDecoration.copyWith(
//               hintText: 'Enter Phone Number'),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           // child: Container
//           child: Text(
//             'Location',
//             style: TextStyle(
//               fontSize: 16.0,
//               fontFamily: 'MerriweatherBold',
//             ),
//           ),
//         ),
//         TextField(
//           keyboardType: TextInputType.emailAddress,
//           textAlign: TextAlign.center,
//           onChanged: (value) {
//             email = value;
//           },
//           decoration:
//               kTextFieldDecoration.copyWith(hintText: 'Enter Location'),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           // child: Container
//           child: Text(
//             'Age',
//             style: TextStyle(
//               fontSize: 16.0,
//               fontFamily: 'MerriweatherBold',
//             ),
//           ),
//         ),
//         TextField(
//           keyboardType: TextInputType.emailAddress,
//           textAlign: TextAlign.center,
//           onChanged: (value) {
//             email = value;
//           },
//           decoration:
//               kTextFieldDecoration.copyWith(hintText: 'Enter Age'),
//         ),
//         SizedBox(
//           height: 60.0,
//         ),
//         // DateTimePicker(),///////////////////////////////////////////////////////////////////////////////////////
//       ],
//     ),
//   ),
// ),
//     );
//   }
// }

// body: Padding(
//   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
//   child: Center(
//     child: ListView(
//       // Column(
//       children: <Widget>[
//         Align(
//           alignment: Alignment.centerLeft,
//           // child: Container
//           child: Text(
//             'First Name',
//             style:
//                 TextStyle(fontSize: 16.0, fontFamily: 'MerriweatherBold'),
//           ),
//         ),
//         //////Inserted Method DataInputField;
//         DataInputField(),
//         SizedBox(
//           height: 20.0,
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           // child: Container
//           child: Text(
//             'Last Name',
//             style:
//                 TextStyle(fontSize: 16.0, fontFamily: 'MerriweatherBold'),
//           ),
//         ),
//         TextField(
//           keyboardType: TextInputType.emailAddress,
//           textAlign: TextAlign.center,
//           // onChanged: (value) {
//           //   lastName = value;
//           // },
//           decoration:
//               kTextFieldDecoration.copyWith(hintText: 'Enter Last Name'),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           // child: Container
//           child: Text(
//             'Email',
//             style: TextStyle(
//               fontSize: 16.0,
//               fontFamily: 'MerriweatherBold',
//             ),
//           ),
//         ),
//         TextField(
//           keyboardType: TextInputType.emailAddress,
//           textAlign: TextAlign.center,
//           onChanged: (value) {
//             email = value;
//           },
//           decoration:
//               kTextFieldDecoration.copyWith(hintText: 'Enter Email'),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           // child: Container
//           child: Text(
//             'Phone Number',
//             style: TextStyle(
//               fontSize: 16.0,
//               fontFamily: 'MerriweatherBold',
//             ),
//           ),
//         ),
//         TextField(
//           keyboardType: TextInputType.emailAddress,
//           textAlign: TextAlign.center,
//           onChanged: (value) {
//             email = value;
//           },
//           decoration: kTextFieldDecoration.copyWith(
//               hintText: 'Enter Phone Number'),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           // child: Container
//           child: Text(
//             'Location',
//             style: TextStyle(
//               fontSize: 16.0,
//               fontFamily: 'MerriweatherBold',
//             ),
//           ),
//         ),
//         TextField(
//           keyboardType: TextInputType.emailAddress,
//           textAlign: TextAlign.center,
//           onChanged: (value) {
//             email = value;
//           },
//           decoration:
//               kTextFieldDecoration.copyWith(hintText: 'Enter Location'),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           // child: Container
//           child: Text(
//             'Age',
//             style: TextStyle(
//               fontSize: 16.0,
//               fontFamily: 'MerriweatherBold',
//             ),
//           ),
//         ),
//         TextField(
//           keyboardType: TextInputType.emailAddress,
//           textAlign: TextAlign.center,
//           onChanged: (value) {
//             email = value;
//           },
//           decoration:
//               kTextFieldDecoration.copyWith(hintText: 'Enter Age'),
//         ),
//         SizedBox(
//           height: 60.0,
//         ),
//         // DateTimePicker(),///////////////////////////////////////////////////////////////////////////////////////
//       ],
//     ),
//   ),
// ),
//     );
//   }
// }
