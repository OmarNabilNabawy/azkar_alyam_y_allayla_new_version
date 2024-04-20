import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:azkar_alyam_y_allayla/commonWidgets/searchingAppBar.dart';
import 'package:azkar_alyam_y_allayla/helpers/screenWidth.dart';
import 'package:azkar_alyam_y_allayla/helpers/spacer.dart';
import 'package:azkar_alyam_y_allayla/otherWidgets/appBarTitleText.dart';
import 'package:azkar_alyam_y_allayla/otherWidgets/notifications.dart';
import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:azkar_alyam_y_allayla/provider/searching.dart';
import 'package:azkar_alyam_y_allayla/screens/favoriteScreen/favoriteScreen.dart';
import 'package:azkar_alyam_y_allayla/screens/mainScreen/mainScreen.dart';
import 'package:azkar_alyam_y_allayla/screens/settingsScreen/settingsScreen.dart';
import 'package:azkar_alyam_y_allayla/sharedPreferences.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    NotificationService.startListeningNotificationEvents();
    SharedPreference().loadingDataRequiredNavigatorKeyContext();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('السماح بالاشعارات'),
            content: const Text(
                'يود تطبيقنا أن يرسل لكم إشعارات بالأذكار في أوقاتها'),
            actions: [
              TextButton(
                  onPressed: () => AwesomeNotifications()
                          .requestPermissionToSendNotifications()
                          .then((_) {
                        Navigator.pop(context);
                        NotificationService().sendNotification();
                      }),
                  child: const Text(
                    'السماح',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'عدم السماح',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        );
      }
      if (isAllowed && !NotificationService.allowedNotification) {
        NotificationService().sendNotification();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive) {
      SharedPreference().saveData(); 
    }
  }

  int index = 0;
  final pages = [
    const MainScreen(),
    const FavoriteScreen(),
    const SettingsScreen(),
  ];
  final appBarTitle = [
    const AppBarTitleText(title: 'أذكار اليوم والليلة'),
    const AppBarTitleText(title: 'الأذكار المفضلة'),
    const AppBarTitleText(title: ' الإعدادات'),
  ];
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context);
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize:
            isMobilScreen() ? Size.fromHeight(43.h) : Size.fromHeight(37.h),
        child: Consumer<Searching>(
          builder: (context, search, child) {
            return search.isSearching
                ? SearchingAppBar(pageIndex: index)
                : AppBar(
                    backgroundColor:
                        themeProvider.myAppTheme[0].mycolorsAppBarsColor,
                    centerTitle: true,
                    title: appBarTitle[index],
                    actions: [
                      index == 2
                          ? const SizedBox()
                          : IconButton(
                              onPressed: () {
                                search.search();
                              },
                              icon: Icon(
                                Icons.search,
                                size: isMobilScreen() ? 30 : 42,
                                color: themeProvider
                                    .myAppTheme[0].mycolorsIconsColor,
                              ),
                            ),
                      widthSpace(10)
                    ],
                  );
          },
        ),
      ),
      body: pages[index],
      backgroundColor: themeProvider.myAppTheme[0].mycolorsPagesBackgroudColor,
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        height: isMobilScreen() ? 42.h : 40.h,
        animationDuration: const Duration(milliseconds: 450),
        color: themeProvider.myAppTheme[0].mycolorsNavigationBarBackground,
        buttonBackgroundColor:
            themeProvider.myAppTheme[0].mycolorsNavigationBarBackground,
        backgroundColor: themeProvider.myAppTheme[0].mycolorsIconsColor,
        items: <Widget>[
          Icon(Icons.home,
              size: 23.w,
              color: themeProvider.myAppTheme[0].mycolorsIconsColor),
          Icon(Icons.star,
              size: 23.w,
              color: themeProvider.myAppTheme[0].mycolorsIconsColor),
          // عملت ده هنا علشان لما اغير الالوان الايكون بتاع الاعدادات يتغير لونه علطول
          Consumer<AppTheme>(
            builder: (context, value, child) {
              return Icon(
                Icons.settings,
                size: 23.w,
                color: themeProvider.myAppTheme[0].mycolorsIconsColor,
              );
            },
          ),
        ],
        onTap: (selectedIndex) {
          setState(() => index = selectedIndex);
        },
      ),
    );
  }
}
