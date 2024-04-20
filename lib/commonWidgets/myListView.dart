// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:azkar_alyam_y_allayla/provider/Fonts.dart';
import 'package:azkar_alyam_y_allayla/provider/searching.dart';
import 'package:azkar_alyam_y_allayla/screens/favoriteScreen/favoriteScreen.dart';
import 'package:azkar_alyam_y_allayla/screens/mainScreen/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:azkar_alyam_y_allayla/const.dart';
import 'package:azkar_alyam_y_allayla/dataModel.dart';
import 'package:azkar_alyam_y_allayla/provider/zakrIndex.dart';

class MyListView extends StatelessWidget {
  final String? listName;
  final List<List<dynamic>> usedListView;
  const MyListView({
    Key? key,
    this.listName,
    required this.usedListView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontsProvider = Provider.of<Fonts>(context, listen: false);
    final themeProvider = Provider.of<AppTheme>(context, listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: ListView.builder(
        itemCount: usedListView.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
            child: GestureDetector(
              onTap: () async {
                Navigator.pushNamed(context, detailsScreenRoutes);
                Provider.of<ZakrIndex>(context, listen: false).cardIndex =
                    index;
                usedListViewInsideDetails = usedListView;
                // علشان لو دخلت للتفاصيل من البحث ورجعت تاني القائمة ترجع مظبوطه زي ما كانت
                await Future.delayed(const Duration(milliseconds: 200));
                if (context.mounted) {
                  Provider.of<Searching>(context, listen: false)
                      .closeSearchAppBar();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  border: Border.all(
                    color: themeProvider
                        .myAppTheme[0].mycolorsSettingContainersBordersColor,
                    width: 2,
                  ),
                ),
                child: ListTile(
                  minLeadingWidth: 20.w,
                  tileColor: themeProvider.myAppTheme[0].mycolorsZakrCardColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  leading: Text('${index + 1}',
                      style: fontsProvider.textFamily700.copyWith(
                          fontSize: (fontsProvider.fontSizeValue * 2.5).sp,
                          color:
                              themeProvider.myAppTheme[0].mycolorsFontColor)),
                  title: Text(usedListView[index][0],
                      style: fontsProvider.textFamily700.copyWith(
                          fontSize: (fontsProvider.fontSizeValue * 3).sp,
                          color:
                              themeProvider.myAppTheme[0].mycolorsFontColor)),
                  trailing: listName == 'Main'
                      ? MainTrailing(cardIndex: index)
                      : FavoriteTrailing(cardIndex: index),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
