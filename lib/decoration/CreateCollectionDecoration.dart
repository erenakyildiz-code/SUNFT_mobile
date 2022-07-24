
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var createCollectionTitle = GoogleFonts.roboto(
  fontWeight: FontWeight.w700,
  fontSize: 32,
  color: Colors.white,
);
var createCollectionDesc = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: Colors.white,
);
var collectionTextDecoration = GoogleFonts.roboto(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
collectionContainer (hintText) => InputDecoration(
  hintText: hintText,
  hintStyle: collectionTextDecoration,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      width: 2,
      color: Colors.white,
    ),


  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      width: 2,
      color: Colors.white,
    ),

  ),

  fillColor: Colors.transparent,
  filled: true,

);

var imagePickerDecoration = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.all(Radius.circular(20)),
    border: Border.all(
      color: Colors.white,
      width: 2,
    )
);


var createButtonTextStyle =  GoogleFonts.roboto(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
var nothingSelectedDecoration = GoogleFonts.roboto(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);