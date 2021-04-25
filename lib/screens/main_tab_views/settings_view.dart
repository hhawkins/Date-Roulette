import 'package:Date_Roulette/components/camera_view.dart';
import 'package:Date_Roulette/components/profile_list_item.dart';
import 'package:Date_Roulette/components/rounded_button.dart';
import 'package:Date_Roulette/constants.dart';
import 'package:Date_Roulette/screens/main_tab_views/profile_settings/notification_screen.dart';
import 'package:Date_Roulette/screens/main_tab_views/profile_settings/preference_screen.dart';
import 'package:Date_Roulette/screens/main_tab_views/profile_settings/profile_screen.dart';
import 'package:Date_Roulette/screens/main_tab_views/profile_settings/sharing_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class SettingsView extends StatelessWidget {
  // Start of new theme widget.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: kLightTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: SettingsScreen(),
          );
        },
      ),
    );
  }
}
////////////////////////////////////
//Start of Camera Class
////////////////////////////////////
// File _image;
// final picker = ImagePicker();
//
// Future getImage() async {
//   final pickedFile = await picker.getImage(source: ImageSource.camera);
//
//   setState(() {
//     if (pickedFile != null) {
//       _image = File(pickedFile.path);
//     } else {
//       print('No image selected.');
//     }
//   });
// }
//
// void setState(Null Function() param0) {
// }

class SettingsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            //margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: 'ProfilePicture',
                  child: CircleAvatar(
                    radius: kSpacingUnit.w * 5,
                    backgroundImage: AssetImage('images/John Jacobs.PNG'),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: IconButton(
                        icon: const Icon(LineAwesomeIcons.pen),
                        //////////////////////////////////////////////////////
                        //on select, Open Camera / Photos
                        /////////////////////////////////////////////////////
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CameraGallery()),
                          );
                        },
                        color: kDarkPrimaryColor,
                        iconSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                        //size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'John Jacobs',
            style: TextStyle(fontSize: 32.0, fontFamily: 'LobsterTwoBold'),
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            'JJacobs@gmail.com',
            style: TextStyle(fontSize: 16.0, fontFamily: 'LobsterTwoBold'),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          /////////////////////////////////////////////////////////////////////
          //Upgrade to PRO Button
          // Container(
          //   height: kSpacingUnit.w * 4,
          //   width: kSpacingUnit.w * 20,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
          //     color: Theme.of(context).accentColor,
          //   ),
          //   child: Center(
          //     child: Text(
          //       'Upgrade to PRO',
          //       style: kButtonTextStyle,
          //     ),
          //   ),
          // ),
          /////////////////////////////////////////////////////////////////////
        ],
      ),
    );

    var themeSwitcher = ThemeSwitcher(
      builder: (context) {
        return AnimatedCrossFade(
          duration: Duration(milliseconds: 200),
          crossFadeState:
              ThemeProvider.of(context).brightness == Brightness.dark
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
          firstChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
            child: Icon(
              LineAwesomeIcons.sun,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
          secondChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
            child: Icon(
              LineAwesomeIcons.moon,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
        );
      },
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 6),
        // Icon(
        //   LineAwesomeIcons.arrow_left,
        //   size: ScreenUtil().setSp(kSpacingUnit.w * 3),
        // ),
        profileInfo,
        themeSwitcher,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: kSpacingUnit.w * 5),
                header,
                Expanded(
                  child: ListView(
                    children: [
                      ProfileListItem(
                        icon: LineAwesomeIcons.user_circle,
                        text: 'Edit Profile',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()),
                          );
                        },
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.horizontal_sliders,
                        text: 'Preferences',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PreferenceScreen()),
                          );
                        },
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.volume_up,
                        text: 'Notifications',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationScreen()),
                          );
                        },
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.share,
                        text: 'Invite Friends',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SharingScreen()),
                          );
                        },
                      ),
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
                              width: 20.0,
                            ),
                            RoundedButton(
                              title: 'Log Out',
                              color: kButtonPrimaryColor,
                              textColor: kColorWhite,
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                            ),
                          ]),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
//////////////////////Old Settings Page
////////////////////////////////////////////////////////////////////////////////

// class _ProfileViewState extends State<ProfileView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//       padding: EdgeInsets.symmetric(horizontal: 24.0),
//       child: ListView(
//         children: [
//           SizedBox(
//             height: 50.0,
//           ),
//           Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Stack(
//                               children: [
//                                 Positioned(
//                                   child: Container(
//                                     margin: EdgeInsets.fromLTRB(0, 30, 30, 30),
//                                     width: 100,
//                                     height: 100,
//                                     decoration: BoxDecoration(
//                                         color: kButtonSecondaryColor,
//                                         shape: BoxShape.circle),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   left: 30,
//                                   bottom: 60,
//                                   child: Center(
//                                       child: Container(
//                                           child: Text(
//                                     'JJ',
//                                     style: new TextStyle(
//                                       fontSize: 40.0,
//                                       // color: Colors.yellow,
//                                     ),
//                                   ))),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               'John Jacobs',
//                               //textAlign: ,
//                               textDirection: TextDirection.rtl,
//                             ),
//                             Text(
//                               'JJacobs@gmail.com',
//                               textDirection: TextDirection.rtl,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//
//
//                     //Buttons begin here.
//
//
//                     SizedBox(
//                       height: 30.0,
//                     ),
//                     RoundedButton(
//                       title: 'Profile',
//                       color: kColorWhite,
//                       textColor: kColorBlack,
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ProfileScreen()),
//                         );
//                       },
//                     ),
//                     RoundedButton(
//                       title: 'Preferences',
//                       color: kColorWhite,
//                       textColor: kColorBlack,
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => PreferenceScreen()),
//                         );
//                       },
//                     ),
//                     RoundedButton(
//                       title: 'Notifications',
//                       color: kColorWhite,
//                       textColor: kColorBlack,
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => NotificationScreen()),
//                         );
//                       },
//                     ),
//                     RoundedButton(
//                       title: 'Invite Friends',
//                       color: kColorWhite,
//                       textColor: kColorBlack,
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => SharingScreen()),
//                         );
//                       },
//                     ),
//                     SizedBox(
//                       height: 70.0,
//                     ),
//                     // RoundedButton(
//                     //   title: 'Save',
//                     //   color: kButtonPrimaryColor,
//                     //   textColor: kColorWhite,
//                     //   onPressed: () {
//                     //     Navigator.pop(context);
//                     //   },
//                     // ),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           RoundedButton(
//                             title: 'Delete Account',
//                             color: kButtonSecondaryColor,
//                             textColor: kColorBlack,
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                           SizedBox(
//                             width: 30.0,
//                           ),
//                           RoundedButton(
//                             title: 'Log Out',
//                             color: kButtonPrimaryColor,
//                             textColor: kColorWhite,
//                             onPressed: () {
//                               Navigator.of(context, rootNavigator: true).pop();
//                             },
//                           ),
//                         ]),
//                   ],
//                 )
//               ]),
//         ],
//       ),
//     ));
//   }
// }
