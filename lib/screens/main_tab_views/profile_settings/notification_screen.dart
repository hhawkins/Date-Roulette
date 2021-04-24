import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../constants.dart';

class NotificationScreen extends StatefulWidget {
  static const String id = 'notification_screen';

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
          buildNotificationOptionRow("Enable Push Notifications", true),
          buildNotificationOptionRow("Enable Email Notifications", true),
          buildNotificationOptionRow("Enable Text Notifications", false),
            buildNotificationOptionRow("Discounts and Promotions", false),
            buildNotificationOptionRow("New + Live Events", false),
            buildNotificationOptionRow("New Friends", false),
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
            Image.asset('images/logo.png', height: 150,
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
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
              onChanged: (bool val) {},
            ),
        ),
      ],
    );
  }
}
