// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// class AlertDialog extends StatelessWidget {
//   AlertDialog({
//     this.title,
//     this.description,
//   });

//   final Color title;
//   final Color description;

//   @override
//   Widget build(BuildContext context) {
//     if (Platform.isIOS) {
//       return CupertinoAlertDialog(
//         title: new Text("Error With Login"),
//         content:
//             new Text("There was an error with the login. Please try again."),
//         actions: <Widget>[
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             child: Text("OK"),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           )
//         ],
//       );
//     } else {
//       return AlertDialog(
//         title: title,
//         content: description,
//         actions: <Widget>[
//           TextButton(
//             child: Text("OK"),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           )
//         ],
//       );
//     }
//   }
// }
