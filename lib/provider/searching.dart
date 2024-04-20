import 'package:flutter/material.dart';

class Searching extends ChangeNotifier {
  bool isSearching = false;
  List<List<dynamic>> searchedList = [];
  TextEditingController searchController = TextEditingController();

  void search() {
    isSearching = true;
    notifyListeners();
  }

  void showSearchedList(List<List<dynamic>> usedList, String inputValue) {
    searchedList = usedList.where((zakr) => zakr[0].contains(inputValue)).toList();
    notifyListeners();
  }

  void clearSearchField() {
    // لازم تحط الاثنين مع بعض علشان يسمع التاثير هناك في الشرط ده ويعيد بناء القائمة تاني
    // (MainScreen - MyListView - helper.item1.text.isEmpty)
    searchController.clear(); // <--
    searchedList = []; // <--
    notifyListeners();
  }

  void closeSearchAppBar() {
    if (searchController.text.isNotEmpty) {
      clearSearchField();
    }
    isSearching = false;
    notifyListeners();
  }
}
