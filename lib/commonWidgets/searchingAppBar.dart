import 'package:azkar_alyam_y_allayla/dataModel.dart';
import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:azkar_alyam_y_allayla/provider/favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:azkar_alyam_y_allayla/helpers/screenWidth.dart';
import 'package:azkar_alyam_y_allayla/provider/searching.dart';

class SearchingAppBar extends StatelessWidget {
  final int pageIndex;
  const SearchingAppBar({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context, listen: false);
    final searchProvider = Provider.of<Searching>(context, listen: false);
    final favoriteProvider = Provider.of<Favorite>(context, listen: false);
    return AppBar(
      backgroundColor: themeProvider.myAppTheme[0].mycolorsAppBarsColor,
      leading: IconButton(
        onPressed: () => searchProvider.closeSearchAppBar(),
        icon: Icon(
          Icons.arrow_back,
          size: isMobilScreen() ? 24 : 35,
          color: themeProvider.myAppTheme[0].mycolorsIconsColor,
        ),
      ),
      title: TextField(
        onChanged: (inputValue) {
          pageIndex == 0
              ? searchProvider.showSearchedList(zakrMainList, inputValue)
              : searchProvider.showSearchedList(
                  favoriteProvider.favoriteListView, inputValue);
        },
        controller: Provider.of<Searching>(context).searchController,
        cursorColor: themeProvider.myAppTheme[0].mycolorsIconsColor,
        autofocus: true,
        style: TextStyle(
          color: themeProvider.myAppTheme[0].mycolorsFontColor,
          decorationThickness: 0,
        ),
        autocorrect: true,
        cursorHeight: 20.h,
        decoration: InputDecoration(
          hintStyle: TextStyle(
              fontSize: 14.sp, color: themeProvider.myAppTheme[0].mycolorsIconsColor),
          hintText: ' بحث...',
          border: InputBorder.none,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => searchProvider.clearSearchField(),
          icon: Icon(
            Icons.close,
            size: isMobilScreen() ? 24 : 35,
            color: themeProvider.myAppTheme[0].mycolorsIconsColor,
          ),
        )
      ],
    );
  }
}
