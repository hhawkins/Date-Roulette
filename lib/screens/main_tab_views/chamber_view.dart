import 'package:flutter/material.dart';

class ChamberView extends StatefulWidget {
  static const String id = 'chamber_view';

  @override
  _ChamberViewState createState() => _ChamberViewState();
}

class _ChamberViewState extends State<ChamberView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(),
      ),
    );
  }
}
