import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../constants.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

class NotificationScreen extends StatefulWidget {
  static const String id = 'notification_screen';

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool enablePushNotifications;
  bool enableEmailNotifications;
  bool enableTextNotifications;
  bool discountsAndPromotionsNotification;
  bool newAndLiveEventsNotifications;
  bool newFriendNotification;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> saveNotificationValues() {
    return users
        .doc(_auth.currentUser.uid)
        .collection("profile")
        .doc("notifications")
        .set({
      'enablePushNotifications': enablePushNotifications,
      'enableEmailNotifications': enableEmailNotifications,
      'enableTextNotifications': enableTextNotifications,
      'discountsAndPromotionsNotification': discountsAndPromotionsNotification,
      'newAndLiveEventsNotifications': newAndLiveEventsNotifications,
      'newFriendNotification': newFriendNotification,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
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
                saveNotificationValues();
                Navigator.pop(context);
              }),
          // CircleBorder(side: BorderSide(color: Colors.transparent)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow(
                enablePushNotifications, "Enable Push Notifications", true),
            buildNotificationOptionRow(
                enableEmailNotifications, "Enable Email Notifications", true),
            buildNotificationOptionRow(
                enableTextNotifications, "Enable Text Notifications", false),
            buildNotificationOptionRow(discountsAndPromotionsNotification,
                "Discounts and Promotions", false),
            buildNotificationOptionRow(
                newAndLiveEventsNotifications, "New + Live Events", false),
            buildNotificationOptionRow(
                newFriendNotification, "New Friends", false),
            SizedBox(
              height: 50,
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 50,
            ),
            Image.asset(
              'images/logo.png',
              height: 150,
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(bool savedValue, String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: kButtonPrimaryColor,
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            value: isActive,
            onChanged: (bool val) {
              savedValue = val;
            },
          ),
        ),
      ],
    );
  }
}
