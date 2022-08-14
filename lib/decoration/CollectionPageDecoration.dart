import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


const collectionNameBoxColor = Color(0x2CFFFFFF);
const collectionOwnerBoxColor = Color(0x2CFFFFFF);
const collectionNameTextColor = Colors.white;
const collectionItemsTextColor = Colors.white;
var collectionNameBoxDecoration = BoxDecoration(
  color: collectionNameBoxColor,
  borderRadius: BorderRadius.all(Radius.circular(20)),

);
var collectionNameTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w700,
  color: collectionNameTextColor,
  fontSize: 16,

);
var collectionDescriptionTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  color: collectionNameTextColor,
  fontSize: 16,

);
var collectionOwnerBoxDecoration = BoxDecoration(
  color: collectionOwnerBoxColor,
  borderRadius: BorderRadius.all(Radius.circular(20)),

);
var collectionOwnerTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  color: collectionNameTextColor,
  fontSize: 16,

);
var collectionItemsTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w700,
  color: collectionItemsTextColor,
  fontSize: 24,

);