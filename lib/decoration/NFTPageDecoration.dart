
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



var addressBoxTextColor = Colors.white;

var priceHistoryTextColor = Colors.white;
var addressBoxTextDecoration = GoogleFonts.roboto(
    color: addressBoxTextColor,
    fontSize: 25,
    fontWeight: FontWeight.w400
);
var addressOfNftText = GoogleFonts.roboto(
    color: addressBoxTextColor,
    fontSize: 15,
    fontWeight: FontWeight.w400
);
var priceHistoryTextStyle = GoogleFonts.roboto(
    color: priceHistoryTextColor,
    fontSize: 20,
    fontWeight: FontWeight.w400
);
var appBarColor = HexColor.fromHex("#01236a");
var listTileColor = Color(0x2CFFFFFF);

var listTileTitleStyle =  GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w400
);
var nftMarketStatusBox = BoxDecoration(
  color: Color(0x2CFFFFFF),
  borderRadius: BorderRadius.all(Radius.circular(20)),


);
marketStatusTextStyle(bool isActive) => GoogleFonts.roboto(
color: isActive ?Colors.white: Colors.grey,
fontSize: 16,
fontWeight: FontWeight.w400
);

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