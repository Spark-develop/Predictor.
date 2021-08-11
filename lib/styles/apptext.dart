import 'package:flutter/material.dart';
import 'package:webapp/styles/appColors.dart';

TextStyle mainTitle = new TextStyle(
    fontFamily: "Open Sans",
    fontSize: 100,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    letterSpacing: -1.0,
    wordSpacing: 3.0);
TextStyle mainScanTitle = new TextStyle(
    fontFamily: "Open Sans",
    fontSize: 40,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    letterSpacing: -1.0,
    wordSpacing: 3.0);

TextStyle cardTitleService = new TextStyle(
    fontFamily: "Open Sans",
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: serviceColor,
    letterSpacing: -1.0,
    wordSpacing: 3.0);

TextStyle bodyHeadline1 = new TextStyle(
    fontFamily: "Open Sans",
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: lightWhite,
    letterSpacing: -1.0,
    wordSpacing: 3.0);

TextStyle cardTitleAccesories = new TextStyle(
    fontFamily: "Open Sans",
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: accesoriesColor,
    letterSpacing: -1.0,
    wordSpacing: 3.0);

TextStyle subTitle = new TextStyle(
    fontFamily: "Avenir",
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: lightGray);

TextStyle userIntroName = new TextStyle(
    fontFamily: "Open Sans",
    fontSize: 26,
    fontWeight: FontWeight.w300,
    color: lightWhite);

TextStyle userIntroDes = new TextStyle(
    fontFamily: "Open Sans",
    fontSize: 14,
    fontWeight: FontWeight.w100,
    color: lightWhite);

TextStyle darkFont = new TextStyle(
    fontFamily: "Open Sans",
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: lightGray);

final k1HintTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'OpenSans',
);
final k2HintTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
