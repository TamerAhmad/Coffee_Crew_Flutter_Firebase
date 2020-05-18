import 'package:flutter/material.dart';

const Color offWhite = Color(0xffECF0F1);
const Color purple = Color(0xff8C7AE6);
const Color blue = Color(0xff0097E6);
const Color grey = Color(0xffD1D1D1);
const Color brownLight = Color(0xffCF976A);
const Color brownDark = Color(0xff805333);

const kStyleTitle =
    TextStyle(color: brownLight, fontSize: 30.0, fontWeight: FontWeight.bold);

const kHintTextStyle = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: kHintTextStyle,
  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
  prefixIcon: Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: Icon(Icons.person,color: brownLight,size: 30.0,),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

const kTextFieldDecoration2 = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: kHintTextStyle,
  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
  prefixIcon: Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: Icon(Icons.person,color: purple,size: 30.0,),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
