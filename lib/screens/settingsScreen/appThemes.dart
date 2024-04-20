import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AppThemes extends StatelessWidget {
  const AppThemes({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      width: double.infinity,
      child: Consumer<AppTheme>(
        builder: (context, appTheme, child) {
          return ListView.builder(
            itemCount: appTheme.settingsContainerThemes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: GestureDetector(
                  onTap: () {
                    appTheme.selectedThemeContainer(index);
                    appTheme.selectedTheme(index);
                  },
                  child: Container(
                    height: 40.h,
                    width: 110.w,
                    decoration: BoxDecoration(
                      color: appTheme.settingsContainerThemes[index].bodyColor,
                      border: Border.all(
                        color:
                            appTheme.settingsContainerThemes[index].isSelected
                                ? appTheme.myAppTheme[0].mycolorsSelectedThemeBorderColor
                                : Colors.transparent,
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'بسم الله',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color:
                              appTheme.settingsContainerThemes[index].fontColor,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
