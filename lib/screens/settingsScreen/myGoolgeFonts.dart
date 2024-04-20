import 'package:azkar_alyam_y_allayla/helpers/screenWidth.dart';
import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:azkar_alyam_y_allayla/provider/Fonts.dart';
import 'package:azkar_alyam_y_allayla/screens/settingsScreen/customSettingsContainer.dart';
import 'package:azkar_alyam_y_allayla/screens/settingsScreen/myFontFamilyButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyGoogleFonts extends StatelessWidget {
  const MyGoogleFonts({super.key});

  @override
  Widget build(BuildContext context) {
    final fonts = Provider.of<Fonts>(context, listen: false);
    final themeProvider = Provider.of<AppTheme>(context);
    return Column(
      children: [
        CustomSettingsContainer(
          child: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '  نوع الخط :- الخط الافتراضي ',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: themeProvider.myAppTheme[0].mycolorsFontColor),
                  ),
                ),
                Expanded(
                  child: MyFontFamilyButton(
                    onPressed: () => fonts.selectFontFamily(-1),
                    textStyle: fontsFamily(-1),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: isMobilScreen() ? 155.h : 192.h,
          child: GridView.builder(
            itemCount: 6,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3.5,
            ),
            itemBuilder: (context, index) {
              return MyFontFamilyButton(
                onPressed: () => fonts.selectFontFamily(index),
                textStyle: fontsFamily(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
