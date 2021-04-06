import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class PreferenceScreen extends StatefulWidget {
  static const String id = 'preference_screen';

  @override
  _PreferenceScreenState createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  String dropdownValue = 'Select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Preferences'),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  // child: Container
                  child: Text(
                    "I'm Looking For..",
                    style: TextStyle(
                        fontFamily: 'LobsterTwo Bold',
                        fontSize: 20.0
                    ),
                  ),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.expand_more),
                  isExpanded: true,
                  iconSize: 40,
                  elevation: 16,
                  style: const TextStyle(color: kButtonPrimaryColor),
                  underline: Container(
                    height: 2,
                    color: kButtonPrimaryColor,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Select','Drinks', 'Brunch', 'Lunch', 'Dinner','Fine Dining', 'Performances', 'Travel & Outdoor','Educational',]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  // child: Container
                  child: Text(
                    "Location",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.expand_more),
                  isExpanded: true,
                  iconSize: 40,
                  elevation: 16,
                  style: const TextStyle(color: kButtonPrimaryColor),
                  underline: Container(
                    height: 2,
                    color: kButtonPrimaryColor,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Select','My Current Location']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  // child: Container
                  child: Text(
                    "Date",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.expand_more),
                  isExpanded: true,
                  iconSize: 40,
                  elevation: 16,
                  style: const TextStyle(color: kButtonPrimaryColor),
                  underline: Container(
                    height: 2,
                    color: kButtonPrimaryColor,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>[
                    'Select','Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  // child: Container
                  child: Text(
                    "Price Range",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.expand_more),
                  iconSize: 40,
                  isExpanded: true,
                  elevation: 16,
                  style: const TextStyle(color: kButtonPrimaryColor),
                  underline: Container(
                    height: 2,
                    color: kButtonPrimaryColor,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>[
                    'Select','Keep it Cheap', 'Moderate', 'Pricey']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            )));
  }
}
