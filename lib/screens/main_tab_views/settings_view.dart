import 'package:Date_Roulette/components/rounded_button.dart';
import 'package:Date_Roulette/constants.dart';
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
                    Hero(
                      tag: 'JJ',
                      child: Container(
                        child: Image.asset('images/JJ.png'),
                        width: 350.0,
                      ),
                    ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Stack(
                    //       children: <Widget>[
                    //         Center(

                    //         ),
                    //         Container(
                    //           margin: EdgeInsets.fromLTRB(0, 30, 30, 30),
                    //           width: 100,
                    //           height: 100,
                    //           decoration: BoxDecoration(
                    //             color: kButtonSecondaryColor,
                    //             shape: BoxShape.circle
                    //           ),
                    //         ),
                    //         Text('JJ')
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                      
                    //   children: <Widget>[
                    //     Text('Test',
                    //     //textAlign: ,
                    //     textDirection: TextDirection.rtl,),
                    //     Text('JJacobs@gmail.com', 
                    //     textDirection: TextDirection.rtl,),
                    //   ],
                    // ),
                  ],
                ),
                SizedBox(
                  height: 60.0,
                ),
                RoundedButton(
                  title: 'Profile',
                    color: kColorWhite,
                    textColor: kColorBlack,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                ),
                RoundedButton(
                  title: 'Preferences',
                    color: kColorWhite,
                    textColor: kColorBlack,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                ),
                RoundedButton(
                  title: 'Notifications',
                    color: kColorWhite,
                    textColor: kColorBlack,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                ),
                RoundedButton(
                  title: 'Invite Friends',
                    color: kColorWhite,
                    textColor: kColorBlack,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                ),
                SizedBox(
                  height: 70.0,
                ),
                RoundedButton(
                  title: 'Save',
                    color: kButtonPrimaryColor,
                    textColor: kColorWhite,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: <Widget>[
                    RoundedButton(
                  title: 'Delete Account',
                    color: kColorWhite,
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
                    color: kButtonSecondaryColor,
                    textColor: kColorBlack,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                ),
                  ]
                ),
              ],)
            ]
          ),
        )
    );
  }
}
