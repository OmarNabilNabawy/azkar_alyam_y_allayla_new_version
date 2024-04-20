import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:azkar_alyam_y_allayla/const.dart';
import 'package:azkar_alyam_y_allayla/dataModel.dart';
import 'package:azkar_alyam_y_allayla/main.dart';
import 'package:azkar_alyam_y_allayla/provider/zakrIndex.dart';
import 'package:provider/provider.dart';
import '../screens/settingsScreen/settingsNotifications.dart';

class NotificationService {
  static bool allowedNotification = false;
  Future<void> awesomeNotificationInitialization() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          importance: NotificationImportance.High,
          soundSource: 'resource://raw/res_thaly',
          locked: true,
          playSound: true,
          enableVibration: true,
          channelShowBadge: true,
        )
      ],
      debug: true,
    );
  }

  static Future<void> startListeningNotificationEvents() async {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: onActionReceivedImplementationMethod);
  }

  void sendNotification() async {
    allowedNotification = true;
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: 'لا تنسي ذكر الله',
        body: 'أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ',
      ),
      schedule: NotificationCalendar(
        timeZone: 'Africa/Cairo',
        minute: 0,
        second: 0,
        millisecond: 0,
        repeats: true,
        allowWhileIdle: true,
        preciseAlarm: true,
      ),
    );
    createNewNotification('أذكار الاستيقاظ من النوم', 2, 1);
    createNewNotification('أذكار لبس الثوب', 3, 2);
    createNewNotification('أذكار الخروج من البيت', 4, 3);
    createNewNotification('أذكار دخول البيت', 5, 4);
    createNewNotification('أذكار الصباح', 6, 5);
    createNewNotification('أذكار المساء', 7, 6);
    createNewNotification('أذكار النوم', 8, 7);
  }

  void createNewNotification(String title, int id, index) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'basic_channel',
        title: title,
        body: 'أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ',
      ),
      schedule: NotificationCalendar(
        timeZone: 'Africa/Cairo',
        hour: notificationTimeList[index - 1].hour,
        minute: notificationTimeList[index - 1].minute,
        second: 0,
        millisecond: 0,
        repeats: true,
        allowWhileIdle: true,
        preciseAlarm: true,
      ),
    );
  }

  static Future<void> onActionReceivedImplementationMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.id != 1) {
      MyApp.navigatorKey.currentState
          ?.pushNamedAndRemoveUntil(detailsScreenRoutes, (route) => true);
      usedListViewInsideDetails = zakrMainList;
      switch (receivedAction.id) {
        case 2:
          Provider.of<ZakrIndex>(MyApp.navigatorKey.currentContext!,
                  listen: false)
              .cardIndex = 1;
          break;
        case 3:
          Provider.of<ZakrIndex>(MyApp.navigatorKey.currentContext!,
                  listen: false)
              .cardIndex = 2;
          break;
        case 4:
          Provider.of<ZakrIndex>(MyApp.navigatorKey.currentContext!,
                  listen: false)
              .cardIndex = 4;
          break;
        case 5:
          Provider.of<ZakrIndex>(MyApp.navigatorKey.currentContext!,
                  listen: false)
              .cardIndex = 5;
          break;
        case 6:
          Provider.of<ZakrIndex>(MyApp.navigatorKey.currentContext!,
                  listen: false)
              .cardIndex = 22;
          break;
        case 7:
          Provider.of<ZakrIndex>(MyApp.navigatorKey.currentContext!,
                  listen: false)
              .cardIndex = 23;
          break;
        case 8:
          Provider.of<ZakrIndex>(MyApp.navigatorKey.currentContext!,
                  listen: false)
              .cardIndex = 25;
          break;
      }
    }
  }
}
