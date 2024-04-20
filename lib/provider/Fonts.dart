import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts extends ChangeNotifier {
  String fontFamilyName = 'Amiri';
  double fontSizeValue = 6;

  TextStyle get textFamily700 =>
      GoogleFonts.getFont(fontFamilyName, fontWeight: FontWeight.w700);
  TextStyle get textFamilyBold =>
      GoogleFonts.getFont(fontFamilyName, fontWeight: FontWeight.bold);

  void changeFontSize(double inputValue) {
    fontSizeValue = inputValue;
    notifyListeners();
  }

  void selectFontFamily(int index) {
    switch (index) {
      case 0:
        fontFamilyName = 'Cairo';
        break;
      case 1:
        fontFamilyName = 'Lalezar';
        break;
      case 2:
        fontFamilyName = 'Marhey';
        break;
      case 3:
        fontFamilyName = 'Rakkas';
        break;
      case 4:
        fontFamilyName = 'Aref Ruqaa';
        break;
      case 5:
        fontFamilyName = 'Markazi Text';
        break;
      default:
        fontFamilyName = 'Amiri';
    }
    notifyListeners();
  }
}
