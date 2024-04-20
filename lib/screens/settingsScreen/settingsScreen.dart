import 'package:azkar_alyam_y_allayla/helpers/spacer.dart';
import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:azkar_alyam_y_allayla/provider/Fonts.dart';
import 'package:azkar_alyam_y_allayla/screens/settingsScreen/appThemes.dart';
import 'package:azkar_alyam_y_allayla/screens/settingsScreen/customSettingsContainer.dart';
import 'package:azkar_alyam_y_allayla/screens/settingsScreen/customSettingsNotificationListTile.dart';
import 'package:azkar_alyam_y_allayla/screens/settingsScreen/myGoolgeFonts.dart';
import 'package:azkar_alyam_y_allayla/screens/settingsScreen/mySlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            heightSpace(10),
            CustomSettingsContainer(
              child: Center(
                child: Text(
                  'إعدادات الخطوط',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: themeProvider.myAppTheme[0].mycolorsFontColor),
                ),
              ),
            ),
            heightSpace(10),
            Consumer<Fonts>(
              builder: (context, fonts, child) {
                return Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10),
                      color: themeProvider.myAppTheme[0]
                          .mycolorsSettingsTemplateContainerColor),
                  child: Center(
                    child: Text(
                      'بسم الله الرحمن الرحيم',
                      style: fonts.textFamily700.copyWith(
                        fontSize: fonts.fontSizeValue * 3.sp,
                        color: themeProvider
                            .myAppTheme[0].mycolorsSettingsTemplateFontColor,
                      ),
                    ),
                  ),
                );
              },
            ),
            heightSpace(10),
            const MySlider(),
            heightSpace(10),
            const MyGoogleFonts(),
            heightSpace(5),
            CustomSettingsContainer(
              child: Center(
                child: Text(
                  'الالوان المختلفة',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: themeProvider.myAppTheme[0].mycolorsFontColor),
                ),
              ),
            ),
            heightSpace(10),
            const AppThemes(),
            heightSpace(10),
            CustomSettingsContainer(
              child: Center(
                child: Text(
                  'الإشعارات',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: themeProvider.myAppTheme[0].mycolorsFontColor),
                ),
              ),
            ),
            heightSpace(10),
            const SettingsNotification(),
            heightSpace(50),
          ],
        ),
      ),
    );
  }
}
