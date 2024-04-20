import 'package:azkar_alyam_y_allayla/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:azkar_alyam_y_allayla/const.dart';
import 'package:azkar_alyam_y_allayla/generated/l10n.dart';
import 'package:azkar_alyam_y_allayla/otherWidgets/notifications.dart';
import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:azkar_alyam_y_allayla/provider/Fonts.dart';
import 'package:azkar_alyam_y_allayla/provider/zakrIndex.dart';
import 'package:azkar_alyam_y_allayla/provider/favorite.dart';
import 'package:azkar_alyam_y_allayla/screens/detailsScreen/detailsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'otherWidgets/homePage.dart';
import 'provider/searching.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().awesomeNotificationInitialization();
  await SharedPreference().getSharedPreference();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static late SharedPreferences sp;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => ZakrIndex()),
              ChangeNotifierProvider(create: (_) => Favorite()),
              ChangeNotifierProvider(create: (_) => Searching()),
              ChangeNotifierProvider(create: (_) => Fonts()),
              ChangeNotifierProvider(create: (_) => AppTheme()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              locale: const Locale('ar'),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              routes: {
                homeScreenRoutes: (ctx) => const HomePage(),
                detailsScreenRoutes: (ctx) => const DetailsScreen(),
              },
            ),
          );
        });
  }
}
