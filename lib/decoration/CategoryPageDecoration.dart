import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var categoryImageBackground = Colors.white;
var categoryNameBoxColor = Color(0x2FFFFFFF);
var categoryImageDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  color: categoryImageBackground,
);

var categoryImageTextStyle = GoogleFonts.roboto(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w700
);

var categoryNameBoxDecoration = BoxDecoration(
  color: categoryNameBoxColor,
  borderRadius: BorderRadius.circular(20),

);