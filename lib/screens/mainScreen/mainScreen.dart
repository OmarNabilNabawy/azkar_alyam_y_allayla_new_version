import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:azkar_alyam_y_allayla/provider/favorite.dart';
import 'package:azkar_alyam_y_allayla/provider/searching.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:azkar_alyam_y_allayla/commonWidgets/myListView.dart';
import 'package:azkar_alyam_y_allayla/helpers/screenWidth.dart';
import 'package:azkar_alyam_y_allayla/dataModel.dart';
import 'package:tuple/tuple.dart';

class MainScreen extends StatelessWidget {
  final int? cardIndex;
  const MainScreen({
    Key? key,
    this.cardIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Selector<Searching, Tuple2<TextEditingController, List<List<dynamic>>>>(
      selector: (_, helper) =>
          Tuple2(helper.searchController, helper.searchedList),
      builder: (context, helper, child) {
        return MyListView(
          listName: 'Main',
          usedListView: helper.item1.text.isEmpty ? zakrMainList : helper.item2,
        );
      },
    );
  }
}

class MainTrailing extends StatefulWidget {
  final int cardIndex;
  const MainTrailing({
    Key? key,
    required this.cardIndex,
  }) : super(key: key);

  @override
  State<MainTrailing> createState() => _MainTrailingState();
}

class _MainTrailingState extends State<MainTrailing> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context, listen: false);
    return Selector<Searching, List<List<dynamic>>>(
      selector: (_, helper) => helper.searchedList,
      builder: (ctx, searchedList, child) {
        return IconButton(
          onPressed: () {
            setState(() {
              Provider.of<Favorite>(context, listen: false).addToFavorites(
                widget.cardIndex,
                searchedList.isEmpty ? zakrMainList : searchedList,
              );
            });
          },
          // عملت كده علشان لما تبقي عامل حديث مفضل قي القائمة الرئيسية
          // وبعد كده بحثت يظهر نجمه المفضلة علي الحديث صح
          icon: searchedList.isEmpty
              ? selectedIconShape(zakrMainList[widget.cardIndex][1],
                  themeProvider.myAppTheme[0].mycolorsIconsColor)
              : selectedIconShape(searchedList[widget.cardIndex][1],
                  themeProvider.myAppTheme[0].mycolorsIconsColor),
        );
      },
    );
  }
}

Icon selectedIconShape(bool isFavor, Color color) {
  return isFavor
      ? Icon(
          Icons.star,
          size: isMobilScreen() ? 35 : 43,
          color: color,
        )
      : Icon(
          Icons.star_outline,
          size: isMobilScreen() ? 35 : 43,
          color: color,
        );
}
