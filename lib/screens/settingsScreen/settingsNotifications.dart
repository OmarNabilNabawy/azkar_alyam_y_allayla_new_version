import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:azkar_alyam_y_allayla/otherWidgets/notifications.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

List<Time> notificationTimeList = [
  Time(hour: 6, minute: 30),
  Time(hour: 6, minute: 45),
  Time(hour: 6, minute: 55),
  Time(hour: 18, minute: 15),
  Time(hour: 5, minute: 10),
  Time(hour: 17, minute: 10),
  Time(hour: 23, minute: 50),
];

void switchOnOffNotifications(bool isSwitched, int index) {
  if (isSwitched) {
    switch (index) {
      case 1:
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
        break;
      case 2:
        NotificationService()
            .createNewNotification('أذكار الاستيقاظ من النوم', 2, 1);
        break;
      case 3:
        NotificationService().createNewNotification('أذكار لبس الثوب', 3, 2);
        break;
      case 4:
        NotificationService()
            .createNewNotification('أذكار الخروج من البيت', 4, 3);
        break;
      case 5:
        NotificationService().createNewNotification('أذكار دخول البيت', 5, 4);
        break;
      case 6:
        NotificationService().createNewNotification('أذكار الصباح', 6, 5);
        break;
      case 7:
        NotificationService().createNewNotification('أذكار المساء', 7, 6);
        break;
      case 8:
        NotificationService().createNewNotification('أذكار النوم', 8, 7);
        break;
    }
  }
  if (!isSwitched) {
    AwesomeNotifications().cancel(index);
  }
}
