import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle getLargerFont(BuildContext context) {
    final theme = Theme.of(context);
    return GoogleFonts.roboto(
      color: theme.brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle getLargeFont(BuildContext context) {
    final theme = Theme.of(context);
    return GoogleFonts.roboto(
      color: theme.brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle getMediumFont(BuildContext context) {
    final theme = Theme.of(context);
    return GoogleFonts.roboto(
      color: theme.brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
  }

  static final TextStyle smallFont = GoogleFonts.roboto(
    color: const Color(0xFF84939A),
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle smallerFont = GoogleFonts.roboto(
    color: const Color(0xFF84939A),
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle inviteText = GoogleFonts.roboto(
    color: const Color(0xFF3AB69B),
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle profileTexts = GoogleFonts.roboto(
    color: const Color(0xFF3AB69B),
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
}
