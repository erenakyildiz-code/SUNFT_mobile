import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
const categoryContainerColor = Color(0x2CFFFFFF);
const collectionInfoColor = Colors.white;
var categoryDecoration = BoxDecoration(
  color: categoryContainerColor,
  borderRadius: BorderRadius.all(Radius.circular(20)),
);


var collectionInfoDecoration = GoogleFonts.roboto(
  color: collectionInfoColor,
  fontWeight: FontWeight.w700,
  fontSize: 25

);