
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}


//HEADER DECORATION
var profileHeaderColor = Color(0x2CFFFFFF);
var dividerColor = Colors.white;
var profileHeaderDecoration = BoxDecoration(
  color: profileHeaderColor,
  borderRadius: BorderRadius.all(Radius.circular(30)),

);
var profileTextStyle = GoogleFonts.roboto(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.w700,

);
var nonLoginButton = GoogleFonts.roboto(
  color: Colors.white,
  fontSize: 50,
  fontWeight: FontWeight.w700,

);
var nonLoginErrorText = GoogleFonts.roboto(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.w400,

);

//BALANCE SHEET DECORATION
var balanceSheetColor = Color(0x2CFFFFFF);

var totalLikesDecoration = BoxDecoration(
  color: balanceSheetColor,
  borderRadius: BorderRadius.vertical(bottom:Radius.circular(30)),

);
var depositWithdraw = GoogleFonts.roboto(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.w400,

);
var balanceSheetText = GoogleFonts.roboto(
  color: Colors.white,
  fontSize: 25,
  fontWeight: FontWeight.w400,

);

var depositPageRouterStyle = BoxDecoration(
  color: balanceSheetColor,
  borderRadius: const BorderRadius.all(Radius.circular(30)),
);
var depositWithdrawTextStyle = GoogleFonts.roboto(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.w700,
);