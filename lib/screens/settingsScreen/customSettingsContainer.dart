import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomSettingsContainer extends StatelessWidget {
  final Widget child;
  const CustomSettingsContainer({
    super.key,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context);
    return Container(
        height: 40.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          border: Border.all(
            color: themeProvider
                .myAppTheme[0].mycolorsSettingContainersBordersColor,
            width: 2,
          ),
        ),
        child: child);
  }
}
