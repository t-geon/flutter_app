import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: PrimaryColor,
      elevation: 0.0,
    ),
    primaryColor: PrimaryColor,
    textSelectionTheme: TextSelectionThemeData(cursorColor: PrimaryColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

/*
TextTheme textTheme() {
  return TextTheme(
    headline1:
        GoogleFonts.nanumGothic(fontSize: 18.0, fontWeight: FontWeight.bold),
    headline2:
        GoogleFonts.nanumGothic(fontSize: 16.0, fontWeight: FontWeight.bold),
    subtitle1: GoogleFonts.nanumGothic(fontSize: 16.0),
    bodyText1: GoogleFonts.nanumGothic(fontSize: 15.0),
    bodyText2: GoogleFonts.nanumGothic(fontSize: 14.0),
  );
}
 */
