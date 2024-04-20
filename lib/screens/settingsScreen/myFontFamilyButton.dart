import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyFontFamilyButton extends StatelessWidget {
  final void Function() onPressed;
  final TextStyle textStyle;
  const MyFontFamilyButton({
    Key? key,
    required this.onPressed,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context);
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(foregroundColor: Colors.black54),
      child: Text(
        'بسم الله الرحمن الرحيم',
        overflow: TextOverflow.ellipsis,
        style: textStyle.copyWith(
          color: themeProvider.myAppTheme[0].mycolorsSettingFontFamilyColor,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}

TextStyle fontsFamily(int index) {
  switch (index) {
    case 0:
      return GoogleFonts.cairo(fontWeight: FontWeight.w700);
    case 1:
      return GoogleFonts.lalezar(fontWeight: FontWeight.w700);
    case 2:
      return GoogleFonts.marhey(fontWeight: FontWeight.w700);
    case 3:
      return GoogleFonts.rakkas(fontWeight: FontWeight.w700);
    case 4:
      return GoogleFonts.arefRuqaa(fontWeight: FontWeight.w700);
    case 5:
      return GoogleFonts.markaziText(fontWeight: FontWeight.w700);
    default:
      return GoogleFonts.amiri(fontWeight: FontWeight.w700);
  }
}
