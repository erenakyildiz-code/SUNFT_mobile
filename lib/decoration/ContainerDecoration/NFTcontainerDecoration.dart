import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const mainBoxColor = Color(0x2CFFFFFF);
const NFTimageContainerColor = Colors.transparent;
const NFTnameColor = Colors.white;
const bottomInfoDecorationColor = Colors.transparent;

const mainBoxDecoration = BoxDecoration(
  color: mainBoxColor,
  borderRadius: BorderRadius.all(Radius.circular(10)),

);

const NFTimageContainerDecoration = BoxDecoration(
  color: NFTimageContainerColor,
  borderRadius: BorderRadius.all(Radius.circular(10)),
);

var NFTnameDecoration = GoogleFonts.roboto(
    color: NFTnameColor,
    fontSize: 25,
    fontWeight: FontWeight.w400
);
var NFTcollectionDecoration = GoogleFonts.roboto(
color: NFTnameColor,
fontSize: 15,
fontWeight: FontWeight.w400
);

var latestPriceDecoration = GoogleFonts.roboto(

    color: NFTnameColor,
    fontSize: 15,
    fontWeight: FontWeight.w300
);

var likeCountDecoration = GoogleFonts.roboto(

    color: NFTnameColor,
    fontSize: 15,
    fontWeight: FontWeight.w300
);

var bottomInfoDecoration = BoxDecoration(
  color: bottomInfoDecorationColor,
  borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),


);