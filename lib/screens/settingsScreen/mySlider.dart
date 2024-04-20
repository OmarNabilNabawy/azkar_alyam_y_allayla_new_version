import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:azkar_alyam_y_allayla/provider/Fonts.dart';
import 'package:azkar_alyam_y_allayla/screens/settingsScreen/customSettingsContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MySlider extends StatelessWidget {
  const MySlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context);
    return Consumer<Fonts>(
      builder: (context, fontSize, child) {
        return CustomSettingsContainer(
          child: Row(
            children: [
              Text(
                '  حجم الخط (${(fontSize.fontSizeValue * 3).round()})',
                style: TextStyle(
                    fontSize: 13.sp, color: themeProvider.myAppTheme[0].mycolorsFontColor),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTickMarkColor: Colors.transparent,
                    inactiveTickMarkColor: Colors.transparent,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.h),
                    thumbColor: themeProvider.myAppTheme[0].mycolorsSettingsSliderthumbColor,
                    activeTrackColor:
                        themeProvider.myAppTheme[0].mycolorsSettingsSliderthumbColor,
                    inactiveTrackColor:
                        themeProvider.myAppTheme[0].mycolorsSettingsSliderthumbColor,
                    overlayColor: Colors.transparent,
                  ),
                  child: Slider(
                    value: fontSize.fontSizeValue,
                    onChanged: (inputValue) =>
                        fontSize.changeFontSize(inputValue),
                    divisions: 12,
                    min: 5,
                    max: 9,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
