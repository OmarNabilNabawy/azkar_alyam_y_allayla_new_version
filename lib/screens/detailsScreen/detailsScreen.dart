// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:azkar_alyam_y_allayla/screens/detailsScreen/detailscard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:azkar_alyam_y_allayla/dataModel.dart';
import 'package:azkar_alyam_y_allayla/helpers/screenWidth.dart';
import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:azkar_alyam_y_allayla/provider/Fonts.dart';
import 'package:azkar_alyam_y_allayla/provider/zakrIndex.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final zakrcardIndex = Provider.of<ZakrIndex>(context).cardIndex;
    final fontsProvider = Provider.of<Fonts>(context, listen: false);
    final themeProvider = Provider.of<AppTheme>(context, listen: false);
    return PopScope(
      onPopInvoked: (didPop) => restartUsedCounters(zakrcardIndex),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isMobilScreen() ? null : 60.h,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back, size: isMobilScreen() ? 25 : 40),
            color: themeProvider.myAppTheme[0].mycolorsIconsColor,
          ),
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              '﴿ ${usedListViewInsideDetails[zakrcardIndex][0]} ﴾',
              style: fontsProvider.textFamilyBold.copyWith(
                  fontSize: (fontsProvider.fontSizeValue * 3.33).sp,
                  color: themeProvider.myAppTheme[0].mycolorsFontColor,
                  height: 2),
            ),
          ),
          backgroundColor:
              themeProvider.myAppTheme[0].mycolorsDetailsBackgroundColor,
          centerTitle: true,
        ),
        backgroundColor:
            themeProvider.myAppTheme[0].mycolorsDetailsBackgroundColor,
        body: Padding(
          padding: EdgeInsets.only(left: 12.w, right: 12.w),
          child: ListView.builder(
            itemCount: usedListViewInsideDetails[zakrcardIndex][2].length,
            itemBuilder: (context, index) {
              return DetailsCard(
                detailscardIndex: index,
              );
            },
          ),
        ),
      ),
    );
  }
}

restartUsedCounters(int zakrcardIndex) {
  for (int i = 0; i < usedListViewInsideDetails[zakrcardIndex][2].length; i++) {
    usedListViewInsideDetails[zakrcardIndex][2][i].counter =
        usedListViewInsideDetails[zakrcardIndex][2][i].originalCounter;
  }
}
