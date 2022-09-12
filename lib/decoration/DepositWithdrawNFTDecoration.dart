

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MainPageItemsDecoration/ProfileDecoration.dart';
var loginButtonColors = HexColor.fromHex("#01236a");

var fieldColors = Colors.white;
var depositWithdrawTitle = GoogleFonts.roboto(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.w700,

);
var dropDownItemTextStyle = GoogleFonts.roboto(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.w700,

);
var withdrawNFT = GoogleFonts.roboto(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.w700,

);
var withdrawButton = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    color: Color(0x2CFFFFFF)
);
var inputDecors = InputDecoration(
  hintText: "Search..",
  border: InputBorder.none,
  suffixIcon: Icon(
    Icons.search,
    color: loginButtonColors,
  ),
);
var loginFormField = BoxDecoration(
  color: fieldColors,
  borderRadius: const BorderRadius.all(Radius.circular(20)),
);