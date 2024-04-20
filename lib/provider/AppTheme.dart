import 'package:azkar_alyam_y_allayla/myThemeModel.dart';
import 'package:flutter/material.dart';

// ===================================== Colors =========================================

Color gold = const Color(0xffDAA520);
Color white = const Color(0xffFFFFFF);
Color black = Colors.black;
Color darkGreen = const Color(0xff013220);
Color lightPurple = const Color(0xffb366ff);
Color darkPurple = const Color(0xff400080);
Color darkBlue = const Color(0xff000080);
Color lightBlue = const Color(0xff0047AB);
Color darkBro = const Color(0xff2e2e1f);
Color lightBro = const Color(0xff999966);
Color darkbrown = const Color(0xff392613);
Color lightbrown = const Color(0xff996633);
Color lightGold = const Color(0xffaf8d3a);

//=======================================================================================

class AppTheme extends ChangeNotifier {
  List<SettingsContainerTheme> settingsContainerThemes = [
    SettingsContainerTheme(
        bodyColor: darkGreen, fontColor: gold, isSelected: true),
    SettingsContainerTheme(bodyColor: black, fontColor: gold),
    SettingsContainerTheme(bodyColor: darkPurple, fontColor: white),
    SettingsContainerTheme(bodyColor: darkBlue, fontColor: white),
    SettingsContainerTheme(bodyColor: darkBro, fontColor: white),
    SettingsContainerTheme(bodyColor: darkbrown, fontColor: white),
  ];

  List<MyAppTheme> myAppTheme = [
    MyAppTheme(
      mycolorsAppBarsColor: darkGreen,
      mycolorsPagesBackgroudColor: white,
      mycolorsNavigationBarBackground: darkGreen,
      mycolorsZakrCardColor: darkGreen,
      mycolorsFontColor: gold,
      mycolorsIconsColor: gold,
      mycolorsDetailsBackgroundColor: darkGreen,
      mycolorsDetailsDividerColor: gold,
      mycolorsDetailsButtonsForgroundColor: darkGreen,
      mycolorsDetailsButtonsBackgroundColor: gold,
      mycolorsSettingsTemplateFontColor: gold,
      mycolorsSettingsTemplateContainerColor: darkGreen,
      mycolorsSettingsSliderthumbColor: darkGreen,
      mycolorsSettingContainersBordersColor: darkGreen,
      mycolorsSettingFontFamilyColor: gold,
      mycolorsSelectedThemeBorderColor: gold,
    )
  ];

  void selectedThemeContainer(int index) {
    for (var i = 0; i < settingsContainerThemes.length; i++) {
      settingsContainerThemes[i].isSelected = false;
    }
    settingsContainerThemes[index].isSelected = true;
    notifyListeners();
  }

  void selectedTheme(int index) {
    switch (index) {
      case 0:
        myAppTheme[0].mycolorsAppBarsColor = darkGreen;
        myAppTheme[0].mycolorsPagesBackgroudColor = white;
        myAppTheme[0].mycolorsNavigationBarBackground = darkGreen;

        myAppTheme[0].mycolorsZakrCardColor = darkGreen;
        myAppTheme[0].mycolorsFontColor = gold;
        myAppTheme[0].mycolorsIconsColor = gold;

        myAppTheme[0].mycolorsDetailsBackgroundColor = darkGreen;
        myAppTheme[0].mycolorsDetailsDividerColor = gold;
        myAppTheme[0].mycolorsDetailsButtonsForgroundColor = darkGreen;
        myAppTheme[0].mycolorsDetailsButtonsBackgroundColor = gold;

        myAppTheme[0].mycolorsSettingsTemplateFontColor = gold;
        myAppTheme[0].mycolorsSettingsTemplateContainerColor = darkGreen;
        myAppTheme[0].mycolorsSettingsSliderthumbColor = darkGreen;
        myAppTheme[0].mycolorsSettingContainersBordersColor = darkGreen;
        myAppTheme[0].mycolorsSettingFontFamilyColor = gold;
        myAppTheme[0].mycolorsSelectedThemeBorderColor = gold;
        break;
      case 1:
        myAppTheme[0].mycolorsAppBarsColor = black;
        myAppTheme[0].mycolorsPagesBackgroudColor = black;
        myAppTheme[0].mycolorsNavigationBarBackground = black;

        myAppTheme[0].mycolorsZakrCardColor = black;
        myAppTheme[0].mycolorsFontColor = gold;
        myAppTheme[0].mycolorsIconsColor = gold;

        myAppTheme[0].mycolorsDetailsBackgroundColor = black;
        myAppTheme[0].mycolorsDetailsDividerColor = gold;
        myAppTheme[0].mycolorsDetailsButtonsForgroundColor = black;
        myAppTheme[0].mycolorsDetailsButtonsBackgroundColor = gold;

        myAppTheme[0].mycolorsSettingsTemplateFontColor = black;
        myAppTheme[0].mycolorsSettingsTemplateContainerColor = gold;
        myAppTheme[0].mycolorsSettingsSliderthumbColor = gold;
        myAppTheme[0].mycolorsSettingContainersBordersColor = gold;
        myAppTheme[0].mycolorsSettingFontFamilyColor = gold;
        myAppTheme[0].mycolorsSelectedThemeBorderColor = gold;
        break;
      case 2:
        myAppTheme[0].mycolorsAppBarsColor = darkPurple;
        myAppTheme[0].mycolorsPagesBackgroudColor = lightPurple;
        myAppTheme[0].mycolorsNavigationBarBackground = darkPurple;

        myAppTheme[0].mycolorsZakrCardColor = darkPurple;
        myAppTheme[0].mycolorsFontColor = white;
        myAppTheme[0].mycolorsIconsColor = white;

        myAppTheme[0].mycolorsDetailsBackgroundColor = darkPurple;
        myAppTheme[0].mycolorsDetailsDividerColor = white;
        myAppTheme[0].mycolorsDetailsButtonsForgroundColor = white;
        myAppTheme[0].mycolorsDetailsButtonsBackgroundColor = lightPurple;

        myAppTheme[0].mycolorsSettingsTemplateFontColor = white;
        myAppTheme[0].mycolorsSettingsTemplateContainerColor = darkPurple;
        myAppTheme[0].mycolorsSettingsSliderthumbColor = white;
        myAppTheme[0].mycolorsSettingContainersBordersColor = darkPurple;
        myAppTheme[0].mycolorsSettingFontFamilyColor = white;
        myAppTheme[0].mycolorsSelectedThemeBorderColor = white;
        break;
      case 3:
        myAppTheme[0].mycolorsAppBarsColor = darkBlue;
        myAppTheme[0].mycolorsPagesBackgroudColor = lightBlue;
        myAppTheme[0].mycolorsNavigationBarBackground = darkBlue;

        myAppTheme[0].mycolorsZakrCardColor = darkBlue;
        myAppTheme[0].mycolorsFontColor = white;
        myAppTheme[0].mycolorsIconsColor = white;

        myAppTheme[0].mycolorsDetailsBackgroundColor = darkBlue;
        myAppTheme[0].mycolorsDetailsDividerColor = white;
        myAppTheme[0].mycolorsDetailsButtonsForgroundColor = white;
        myAppTheme[0].mycolorsDetailsButtonsBackgroundColor = lightBlue;

        myAppTheme[0].mycolorsSettingsTemplateFontColor = white;
        myAppTheme[0].mycolorsSettingsTemplateContainerColor = darkBlue;
        myAppTheme[0].mycolorsSettingsSliderthumbColor = white;
        myAppTheme[0].mycolorsSettingContainersBordersColor = darkBlue;
        myAppTheme[0].mycolorsSettingFontFamilyColor = white;
        myAppTheme[0].mycolorsSelectedThemeBorderColor = white;
        break;
      case 4:
        myAppTheme[0].mycolorsAppBarsColor = darkBro;
        myAppTheme[0].mycolorsPagesBackgroudColor = lightBro;
        myAppTheme[0].mycolorsNavigationBarBackground = darkBro;

        myAppTheme[0].mycolorsZakrCardColor = darkBro;
        myAppTheme[0].mycolorsFontColor = white;
        myAppTheme[0].mycolorsIconsColor = white;

        myAppTheme[0].mycolorsDetailsBackgroundColor = darkBro;
        myAppTheme[0].mycolorsDetailsDividerColor = white;
        myAppTheme[0].mycolorsDetailsButtonsForgroundColor = white;
        myAppTheme[0].mycolorsDetailsButtonsBackgroundColor = lightBro;

        myAppTheme[0].mycolorsSettingsTemplateFontColor = white;
        myAppTheme[0].mycolorsSettingsTemplateContainerColor = darkBro;
        myAppTheme[0].mycolorsSettingsSliderthumbColor = white;
        myAppTheme[0].mycolorsSettingContainersBordersColor = darkBro;
        myAppTheme[0].mycolorsSettingFontFamilyColor = white;
        myAppTheme[0].mycolorsSelectedThemeBorderColor = white;
        break;
      case 5:
        myAppTheme[0].mycolorsAppBarsColor = darkbrown;
        myAppTheme[0].mycolorsPagesBackgroudColor = lightbrown;
        myAppTheme[0].mycolorsNavigationBarBackground = darkbrown;

        myAppTheme[0].mycolorsZakrCardColor = darkbrown;
        myAppTheme[0].mycolorsFontColor = white;
        myAppTheme[0].mycolorsIconsColor = white;

        myAppTheme[0].mycolorsDetailsBackgroundColor = darkbrown;
        myAppTheme[0].mycolorsDetailsDividerColor = white;
        myAppTheme[0].mycolorsDetailsButtonsForgroundColor = white;
        myAppTheme[0].mycolorsDetailsButtonsBackgroundColor = lightbrown;

        myAppTheme[0].mycolorsSettingsTemplateFontColor = white;
        myAppTheme[0].mycolorsSettingsTemplateContainerColor = darkbrown;
        myAppTheme[0].mycolorsSettingsSliderthumbColor = white;
        myAppTheme[0].mycolorsSettingContainersBordersColor = white;
        myAppTheme[0].mycolorsSettingFontFamilyColor = white;
        myAppTheme[0].mycolorsSelectedThemeBorderColor = white;
        break;
    }
    notifyListeners();
  }
}
