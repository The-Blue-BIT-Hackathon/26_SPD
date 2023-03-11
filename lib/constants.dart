import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
Color kprimaryColor = Color(0xfff1976D2);
Color ksecondaryColor = Color(0xfffD0E3F5);
Color kpostColor = Color(0xfffC7E3FF);
Color kbgColor = Color(0xfffE9F2FB);

const kAnimationDuration = Duration(milliseconds: 200);
//  Theme Style
ThemeData khojTheme = ThemeData(
  // textTheme: GoogleFonts.poppinsTextTheme(),
  scaffoldBackgroundColor: ksecondaryColor,
  iconTheme: IconThemeData(color: Color(0xfff1976D2)),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: kprimaryColor,
    secondary: ksecondaryColor,
  ),
);

//Container Decoration
BoxDecoration kfillbox10 = BoxDecoration(
  color: ksecondaryColor,
  borderRadius: BorderRadius.circular(10),
);
BoxDecoration kfillbox20 = BoxDecoration(
  color: kpostColor,
  borderRadius: BorderRadius.circular(20),
);

//Text Style

// TextStyle kTextPopB24 = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);

TextStyle kTextPopB24 =
    GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.bold);
TextStyle kTextPopM16 =
    GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600);
TextStyle kTextPopB16 =
    GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.bold);
TextStyle kTextPopR14 =
    GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w400);
TextStyle kTextPopB14 =
    GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.bold);
TextStyle kTextPopR12 =
    GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w400);

//MediaQuery