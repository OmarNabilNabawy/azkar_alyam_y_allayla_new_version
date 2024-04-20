import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:azkar_alyam_y_allayla/provider/Fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AppBarTitleText extends StatelessWidget {
  final String title;
  const AppBarTitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context);
    final fontsProvider = Provider.of<Fonts>(context,listen: false);
    return Text(
      title,
      style: fontsProvider.textFamilyBold.copyWith(
        fontSize: 22.sp,
        color: themeProvider.myAppTheme[0].mycolorsFontColor,
      ),
    );
  }
}
