import 'package:flutter/material.dart';

const kButtonPrimaryColor = Color(0xff9C0000);
const kButtonSecondaryColor = Color(0xffFFE9E9);
const kButtonLastColor = Color(0xffFFFFFF);
const kColorBlack = Color(0xff000000);
const kColorWhite = Color(0xffFFFFFF);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kButtonPrimaryColor, width: 1.0),
   // borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kButtonPrimaryColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);