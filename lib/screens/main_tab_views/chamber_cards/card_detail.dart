import 'package:flutter/material.dart';

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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(),
      ),
    );
  }
}
