import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 20.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  enabledBorder: OutlineInputBorder(
    // borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 1.0),
    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  focusedBorder: OutlineInputBorder(
    // borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
);

const kAnimatedTextStyle = TextStyle(
  fontSize: 35.0,
  fontWeight: FontWeight.w900,
  // color: Colors.deepPurple,
  color: Colors.deepOrangeAccent,
);
