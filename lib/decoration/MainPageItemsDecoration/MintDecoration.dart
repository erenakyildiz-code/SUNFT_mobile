import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const titleColor = Colors.white;
const dropdownItemTextColor = Colors.white;

var mintTitle =GoogleFonts.roboto(
  fontSize: 35,
  fontWeight: FontWeight.w700,
  color: titleColor,
);

var mintDetails = GoogleFonts.roboto(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: titleColor,
);

collectionContainer (hintText) => InputDecoration(
  hintText: hintText,
  hintStyle: dropdownItemTextDecoration,
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

var dropdownItemTextDecoration = GoogleFonts.roboto(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: dropdownItemTextColor,
);

var collectionDropdownTitle = GoogleFonts.roboto(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: dropdownItemTextColor,
);

var imagePickerDecoration = BoxDecoration(
color: Colors.transparent,
borderRadius: BorderRadius.all(Radius.circular(20)),
border: Border.all(
color: Colors.white,
width: 2,
)
);
var nothingSelectedDecoration = GoogleFonts.roboto(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: dropdownItemTextColor,
);

var mintButtonTextStyle =  GoogleFonts.roboto(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: dropdownItemTextColor,
);