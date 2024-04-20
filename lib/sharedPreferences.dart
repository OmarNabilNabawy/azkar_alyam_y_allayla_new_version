import 'dart:convert';
import 'package:azkar_alyam_y_allayla/dataModel.dart';
import 'package:azkar_alyam_y_allayla/main.dart';
import 'package:azkar_alyam_y_allayla/myThemeModel.dart';
import 'package:azkar_alyam_y_allayla/otherWidgets/notifications.dart';
import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:azkar_alyam_y_allayla/provider/Fonts.dart';
import 'package:azkar_alyam_y_allayla/provider/favorite.dart';
import 'package:azkar_alyam_y_allayla/screens/settingsScreen/customSettingsNotificationListTile.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/settingsScreen/settingsNotifications.dart';
import 'zakrTitleAndFavorModel.dart';

class SharedPreference {
  getSharedPreference() async {
    MyApp.sp = await SharedPreferences.getInstance();
    loadData();
  }

  Future<void> saveData() async {
    // save the user's choice of whether to receive notifications
    MyApp.sp.setBool(
        'scheduleNotification', NotificationService.allowedNotification);
    // save titleAndFavorList
    String jsonString = jsonEncode(titleAndFavor);
    await MyApp.sp.setString('titleAndFavor', jsonString);
    // save current fontSizeValue
    MyApp.sp.setDouble(
        'fontSize',
        Provider.of<Fonts>(MyApp.navigatorKey.currentContext!, listen: false)
            .fontSizeValue);
    // save current selected font family name
    MyApp.sp.setString(
        'fontFamily',
        Provider.of<Fonts>(MyApp.navigatorKey.currentContext!, listen: false)
            .fontFamilyName);
    // save myAppTheme
    final jsonThemeList =
        Provider.of<AppTheme>(MyApp.navigatorKey.currentContext!, listen: false)
            .myAppTheme
            .map((theme) => theme.toJson())
            .toList();
    await MyApp.sp.setString('myAppTheme', json.encode(jsonThemeList));
    // save SettingsContainerTheme
    final jsonContainerThemeList =
        Provider.of<AppTheme>(MyApp.navigatorKey.currentContext!, listen: false)
            .settingsContainerThemes
            .map((theme) => theme.toJson())
            .toList();
    await MyApp.sp
        .setString('ContainerThemes', json.encode(jsonContainerThemeList));
    // save Settings notification bool list
    String notificationList =
        json.encode(CustomSettingsNotificationListTile.notificationSwitch);
    await MyApp.sp.setString('notificationSwitch', notificationList);
    // save Settings notification Time list
    List<String> stringList = notificationTimeList
        .map((time) => '${time.hour}:${time.minute}')
        .toList();
    await MyApp.sp.setStringList('timeList', stringList);
  }

  loadData() {
    bool? sharedNotification = MyApp.sp.getBool('scheduleNotification');
    if (sharedNotification != null) {
      NotificationService.allowedNotification = sharedNotification;
    }
    String? jsonString = MyApp.sp.getString('titleAndFavor');
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      titleAndFavor =
          jsonList.map((item) => ZakrTitleAndFavor.fromJson(item)).toList();
    }
    String? notificationList = MyApp.sp.getString('notificationSwitch');
    if (notificationList != null) {
      CustomSettingsNotificationListTile.notificationSwitch =
          List<bool>.from(json.decode(notificationList));
    }
    //load notification time list
    List<String>? stringList = MyApp.sp.getStringList('timeList');
    if (stringList != null) {
      notificationTimeList = stringList.map((str) {
        List<String> parts = str.split(':');
        return Time(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
      }).toList();
    }
  }

  void loadingDataRequiredNavigatorKeyContext() {
    final favorite = Provider.of<Favorite>(MyApp.navigatorKey.currentContext!);
    final fonts = Provider.of<Fonts>(MyApp.navigatorKey.currentContext!);
    final appTheme = Provider.of<AppTheme>(MyApp.navigatorKey.currentContext!);
    // to call favorite zakr after loading data in favorite page
    favorite.favoriteListView = zakrMainList.where((zakr) => zakr[1]).toList();
    //  to call saved app font size && saved app font family
    double? fontSize = MyApp.sp.getDouble('fontSize');
    String? fontFamily = MyApp.sp.getString('fontFamily');
    if (fontSize != null && fontFamily != null) {
      fonts.fontSizeValue = fontSize;
      fonts.fontFamilyName = fontFamily;
    }
    // to call saved app AppTheme colors && SettingsContainerTheme
    final jsonTheme = MyApp.sp.getString('myAppTheme');
    final jsonContainerTheme = MyApp.sp.getString('ContainerThemes');
    if (jsonTheme != null && jsonContainerTheme != null) {
      final jsonListTheme = json.decode(jsonTheme) as List<dynamic>;
      appTheme.myAppTheme =
          jsonListTheme.map((json) => MyAppTheme.fromJson(json)).toList();
      final jsonListContainerTheme =
          json.decode(jsonContainerTheme) as List<dynamic>;
      appTheme.settingsContainerThemes = jsonListContainerTheme
          .map((json) => SettingsContainerTheme.fromJson(json))
          .toList();
    }
  }
}
