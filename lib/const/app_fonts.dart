import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kUnderline() =>
    GoogleFonts.lato(decoration: TextDecoration.lineThrough, fontSize: 11.sp);

TextStyle kTextStyle() =>
    GoogleFonts.lato(fontSize: 14.sp, fontWeight: FontWeight.w400);

TextStyle kkTextStyle() =>
    GoogleFonts.lato(fontSize: 16.sp, fontWeight: FontWeight.w400);

TextStyle sTextStyle() => GoogleFonts.lato(fontSize: 10);

TextStyle kBoldTextStyle() =>
    GoogleFonts.lato(fontSize: 14.sp, fontWeight: FontWeight.w500);

TextStyle kkBoldTextStyle() =>
    GoogleFonts.lato(fontSize: 16.sp, fontWeight: FontWeight.w700);
TextStyle kButtonTextStyle() => GoogleFonts.lato(
  color: Colors.white,
  fontSize: 14.sp,
  fontWeight: FontWeight.w500,
);
TextStyle kkWhiteTextStyle() => GoogleFonts.lato(
  fontSize: 16.sp,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

TextStyle tabsTextStyle() =>
    GoogleFonts.lato(fontSize: 15.sp, fontWeight: FontWeight.w500);

TextStyle sBoldTextStyle() =>
    GoogleFonts.lato(fontSize: 12.sp, fontWeight: FontWeight.bold);
