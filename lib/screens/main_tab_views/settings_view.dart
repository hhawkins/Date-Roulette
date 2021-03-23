import 'package:Date_Roulette/components/rounded_button.dart';
import 'package:Date_Roulette/constants.dart';
import 'package:Date_Roulette/screens/main_tab_views/profile_settings/notification_screen.dart';
import 'package:Date_Roulette/screens/main_tab_views/profile_settings/preference_screen.dart';
import 'package:Date_Roulette/screens/main_tab_views/profile_settings/profile_screen.dart';
import 'package:Date_Roulette/screens/main_tab_views/profile_settings/sharing_screen.dart';
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
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          children: [
                            Positioned(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 30, 30, 30),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: kButtonSecondaryColor,
                                    shape: BoxShape.circle),
                              ),
                            ),
                            Positioned(
                              left: 30,
                              bottom: 60,
                              child: Center(
                                  child: Container(
                                      child: Text(
                                'JJ',
                                style: new TextStyle(
                                  fontSize: 40.0,
                                  // color: Colors.yellow,
                                ),
                              ))),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'John Jacobs',
                          //textAlign: ,
                          textDirection: TextDirection.rtl,
                        ),
                        Text(
                          'JJacobs@gmail.com',
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                RoundedButton(
                  title: 'Profile',
                  color: kColorWhite,
                  textColor: kColorBlack,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                ),
                RoundedButton(
                  title: 'Preferences',
                  color: kColorWhite,
                  textColor: kColorBlack,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PreferenceScreen()),
                    );
                  },
                ),
                RoundedButton(
                  title: 'Notifications',
                  color: kColorWhite,
                  textColor: kColorBlack,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()),
                    );
                  },
                ),
                RoundedButton(
                  title: 'Invite Friends',
                  color: kColorWhite,
                  textColor: kColorBlack,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SharingScreen()),
                    );
                  },
                ),
                SizedBox(
                  height: 70.0,
                ),
                // RoundedButton(
                //   title: 'Save',
                //   color: kButtonPrimaryColor,
                //   textColor: kColorWhite,
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                // ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundedButton(
                        title: 'Delete Account',
                        color: kButtonSecondaryColor,
                        textColor: kColorBlack,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      RoundedButton(
                        title: 'Log Out',
                        color: kButtonPrimaryColor,
                        textColor: kColorWhite,
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    ]),
              ],
            )
          ]),
    ));
  }
}
