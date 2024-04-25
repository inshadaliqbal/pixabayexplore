import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kAppBarColor = Color(0xFFE9DFCB);

TextStyle kMainTitle = GoogleFonts.satisfy(
  textStyle: const TextStyle(
    color: Colors.black87,
    fontSize: 26,
    letterSpacing: 2,
    fontWeight: FontWeight.w800,
  ),
);

class KThemeData {
  static ThemeData getTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black12,
      textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: Colors.black),
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      }),
      primaryColor: Colors.blue,
    );
  }
}

BoxDecoration kButtonBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(30.0),
  border: Border.all(
    color: Colors.black, // Set border color
    width: 1.0, // Set border width
  ),
);

InputDecoration kTextFieldInputDecoration = InputDecoration(
  prefixIcon: Icon(Icons.search),
  prefixIconColor: Colors.black38,
  hintText: 'Enter your text',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(
      color: Colors.black,
      width: 1,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(
      color: Colors.black,
      width: 1,
    ),
  ),
);
