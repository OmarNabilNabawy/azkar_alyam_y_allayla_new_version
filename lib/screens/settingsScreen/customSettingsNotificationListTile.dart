import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:azkar_alyam_y_allayla/screens/settingsScreen/settingsNotifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

class CustomSettingsNotificationListTile extends StatefulWidget {
  static List<bool> notificationSwitch = List.filled(8, true);
  final String title;
  final int switchIndex;
  final String toastMsg;
  const CustomSettingsNotificationListTile({
    Key? key,
    required this.title,
    required this.switchIndex,
    required this.toastMsg,
  }) : super(key: key);

  @override
  State<CustomSettingsNotificationListTile> createState() =>
      _CustomSettingsNotificationListTileState();
}

class _CustomSettingsNotificationListTileState
    extends State<CustomSettingsNotificationListTile> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context);
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: SizedBox(
        child: IconButton(
          onPressed: widget.switchIndex != 0
              ? () {
                  Navigator.of(context).push(
                    showPicker(
                      value: notificationTimeList[widget.switchIndex - 1],
                      onChange: (selectedTime) {
                        notificationTimeList[widget.switchIndex - 1] =
                            selectedTime;
                        Fluttertoast.showToast(
                          msg: widget.toastMsg,
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor:
                              themeProvider.myAppTheme[0].mycolorsFontColor,
                          textColor: themeProvider
                              .myAppTheme[0].mycolorsPagesBackgroudColor,
                          fontSize: 14.sp,
                        );
                        if (CustomSettingsNotificationListTile
                            .notificationSwitch[widget.switchIndex]) {
                          AwesomeNotifications().cancel(widget.switchIndex + 1);
                          switchOnOffNotifications(
                              true, widget.switchIndex + 1);
                        }
                      },
                      accentColor: themeProvider
                          .myAppTheme[0].mycolorsPagesBackgroudColor,
                      backgroundColor:
                          themeProvider.myAppTheme[0].mycolorsFontColor,
                      buttonStyle: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(themeProvider
                            .myAppTheme[0].mycolorsPagesBackgroudColor),
                        textStyle: MaterialStatePropertyAll(
                          TextStyle(fontSize: 12.sp),
                        ),
                      ),
                    ),
                  );
                }
              : null,
          color: themeProvider.myAppTheme[0].mycolorsFontColor,
          icon: Icon(
            Icons.access_time,
            size: 20.w,
          ),
        ),
      ),
      title: Text(
        widget.title,
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: themeProvider.myAppTheme[0].mycolorsFontColor),
      ),
      trailing: Transform.scale(
        scale: 0.8.h,
        child: Switch(
          activeColor: themeProvider.myAppTheme[0].mycolorsFontColor,
          inactiveTrackColor: Colors.white,
          value: CustomSettingsNotificationListTile
              .notificationSwitch[widget.switchIndex],
          onChanged: (value) {
            CustomSettingsNotificationListTile
                .notificationSwitch[widget.switchIndex] = value;
            switchOnOffNotifications(value, widget.switchIndex + 1);
            setState(() {});
          },
        ),
      ),
    );
  }
}

class SettingsNotification extends StatelessWidget {
  const SettingsNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomSettingsNotificationListTile(
          title: 'لا تنسي ذكر الله (كل ساعة)',
          toastMsg: '',
          switchIndex: 0,
        ),
        CustomSettingsNotificationListTile(
          title: 'أذكار الاستيقاظ من النوم',
          toastMsg: 'تم ضبط أذكار الاستيقاظ من النوم',
          switchIndex: 1,
        ),
        CustomSettingsNotificationListTile(
          title: 'أذكار لبس الثوب',
          toastMsg: 'تم ضبط أذكار لبس الثوب',
          switchIndex: 2,
        ),
        CustomSettingsNotificationListTile(
          title: 'أذكار الخروج من البيت',
          toastMsg: 'تم ضبط أذكار الخروج من البيت',
          switchIndex: 3,
        ),
        CustomSettingsNotificationListTile(
          title: 'أذكار دخول البيت',
          toastMsg: 'تم ضبط أذكار دخول البيت',
          switchIndex: 4,
        ),
        CustomSettingsNotificationListTile(
          title: 'أذكار الصباح',
          toastMsg: 'تم ضبط أذكار الصباح',
          switchIndex: 5,
        ),
        CustomSettingsNotificationListTile(
          title: 'أذكار المساء',
          toastMsg: 'تم ضبط أذكار المساء',
          switchIndex: 6,
        ),
        CustomSettingsNotificationListTile(
          title: 'أذكار النوم',
          toastMsg: 'تم ضبط أذكار النوم',
          switchIndex: 7,
        ),
      ],
    );
  }
}
