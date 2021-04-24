import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../constants.dart';

class CardDetailView extends StatefulWidget {
  static const String id = 'card_detail';

  @override
  _CardDetailViewState createState() => _CardDetailViewState();
}

class _CardDetailViewState extends State<CardDetailView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(),
      ),
    );
  }
}
