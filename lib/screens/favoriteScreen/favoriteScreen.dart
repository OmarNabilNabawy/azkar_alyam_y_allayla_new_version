import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:azkar_alyam_y_allayla/provider/Fonts.dart';
import 'package:azkar_alyam_y_allayla/provider/searching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:azkar_alyam_y_allayla/commonWidgets/myListView.dart';
import 'package:azkar_alyam_y_allayla/helpers/screenWidth.dart';
import 'package:azkar_alyam_y_allayla/provider/favorite.dart';
import 'package:tuple/tuple.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context,listen: false);
    final favoriteListView = Provider.of<Favorite>(context).favoriteListView;
    final fontProvider = Provider.of<Fonts>(context,listen: false);
    if (favoriteListView.isEmpty) {
      return Center(
        child: Text(
          'ليس هناك اذكار في المفضلة',
          style: fontProvider.textFamily700.copyWith(
            fontSize: 16.sp,
            color: themeProvider.myAppTheme[0].mycolorsFontColor,
          ),
        ),
      );
    } else {
      return Selector<Searching,
          Tuple2<TextEditingController, List<List<dynamic>>>>(
        selector: (_, helper) =>
            Tuple2(helper.searchController, helper.searchedList),
        builder: (ctx, helper, child) {
          return MyListView(
            usedListView:
                helper.item1.text.isEmpty ? favoriteListView : helper.item2,
          );
        },
      );
    }
  }
}

class FavoriteTrailing extends StatelessWidget {
  final int cardIndex;
  const FavoriteTrailing({
    Key? key,
    required this.cardIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context,listen: false);
    final favoriteListView =
        Provider.of<Favorite>(context, listen: false).favoriteListView;
    final searchedList =
        Provider.of<Searching>(context, listen: false).searchedList;
    return IconButton(
      onPressed: () =>
          Provider.of<Favorite>(context, listen: false).removeFromFavorites(
        cardIndex,
        searchedList.isEmpty ? favoriteListView : searchedList,
      ),
      icon: Icon(
        Icons.star,
        size: isMobilScreen() ? 35 : 43,
        color: themeProvider.myAppTheme[0].mycolorsIconsColor,
      ),
    );
  }
}
