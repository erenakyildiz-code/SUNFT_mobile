//login page decoration
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
//items
var loginButtonColors = HexColor.fromHex("#01236a");
var fieldColors = Colors.white;
var mainTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w700,
  fontSize: 50,
  color: fieldColors
);
var descriptionTextStyle = GoogleFonts.roboto(
color: fieldColors,
fontSize: 15,
fontWeight: FontWeight.w400
);
var loginUsernameFieldInputDecoration = InputDecoration(
  hintText: "Username",
  border: InputBorder.none,
  suffixIcon: Icon(
      Icons.person,
      color: loginButtonColors
  ),
);

TextStyle loginSubmitButton = TextStyle(
    color: fieldColors,
    fontSize: 30,
);


var loginPasswordFieldInputDecoration = InputDecoration(
  hintText: "Password",
  border: InputBorder.none,
  suffixIcon: Icon(
    Icons.password,
    color: loginButtonColors,
  ),
);
var loginFormField = BoxDecoration(
  color: fieldColors,
  borderRadius: const BorderRadius.all(Radius.circular(20)),
);
var loginFormFieldButton = BoxDecoration(
  color: loginButtonColors,
  borderRadius: const BorderRadius.all(Radius.circular(20)),
);
final List<String> imageList = [
  "https://lh3.googleusercontent.com/c5rFrzgsa4EIMKSujwvwu3i_yHgoGWyegPfjN4uw3TAxjmagCV2L9I3qsJm1VYKTtK4pLYP9W8b6ReODEMK1RIbffTRYWcJshsbl=w600",
  "https://lh3.googleusercontent.com/eo_OEbYFUD87dGay7MKsxz1Grz2Qz9_-HsWBwrotRLHJgScIIjOZudKXHePeabeZFIy7kHYyBo0w29AYpXW2YhydZJkgo-E69rgp=w600",
  "https://lh3.googleusercontent.com/PR4tFYvWZniWIBQEfaUQ5n0xZO4g71fHuD_ad4DwfgSUHRcmIRFq866qEtV1m8j68vf64Zh_hEb04Acm9p8roMpKnoU11c0yc7zX7Q=w600",
  "https://lh3.googleusercontent.com/4VOmNoE782Yl0BcF0kpN7vwS9xLW3yIAk3Q2rDHfqo3lBW-IdbhuTAUJTHJnNbidjjCcO8aVF7WiYVjWlTXecq_yxmaj9DhgnpL21Q=w600",
  "https://hifinews.com/images/styles/600_wide/public/1118classicalcompanion.promo_.jpg",
];

