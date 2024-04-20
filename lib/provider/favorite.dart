import 'package:azkar_alyam_y_allayla/dataModel.dart';
import 'package:flutter/material.dart';

class Favorite extends ChangeNotifier {
  List<List<dynamic>> favoriteListView = [];

  void addToFavorites(int cardIndex, List<List<dynamic>> usedList) {
    usedList[cardIndex][1] = !usedList[cardIndex][1];
    favoriteListView = usedList.where((zakr) => zakr[1]).toList();
    titleAndFavor.where((element) {
      element.title == usedList[cardIndex][0];
      return element.isFavor = usedList[cardIndex][1];
    });
    addToAndRemovefromFavorList(cardIndex, usedList);
    notifyListeners();
  }

  void removeFromFavorites(int cardIndex, List<List<dynamic>> usedList) {
    for (var zakr in zakrMainList) {
      if (zakr[0] == usedList[cardIndex][0]) {
        zakr[1] = false;
      }
    }
    if (usedList != favoriteListView) {
      favoriteListView.removeWhere(
        (zakr) => zakr[0] == usedList[cardIndex][0],
      );
    }
    addToAndRemovefromFavorList(cardIndex, usedList);
    usedList.removeAt(cardIndex);
    notifyListeners();
  }
}

void addToAndRemovefromFavorList(int cardIndex, List<List<dynamic>> usedList) {
  for (var titlefavor in titleAndFavor) {
    if (titlefavor.title == usedList[cardIndex][0]) {
      titlefavor.isFavor = usedList[cardIndex][1];
    }
  }
}
