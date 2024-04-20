// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SettingsContainerTheme {
  bool isSelected;
  Color bodyColor;
  Color fontColor;
  SettingsContainerTheme({
    this.isSelected = false,
    required this.bodyColor,
    required this.fontColor,
  });

  Map<String, dynamic> toJson() {
    return {
      'isSelected': isSelected,
      'bodyColor': bodyColor.value,
      'fontColor': fontColor.value,
    };
  }

  factory SettingsContainerTheme.fromJson(Map<String, dynamic> json) {
    return SettingsContainerTheme(
      isSelected: json['isSelected'],
      bodyColor: Color(json['bodyColor']),
      fontColor: Color(json['fontColor']),
    );
  }
}

class MyAppTheme {
  Color mycolorsAppBarsColor;
  Color mycolorsPagesBackgroudColor;
  Color mycolorsNavigationBarBackground;

  Color mycolorsZakrCardColor;
  Color mycolorsFontColor;
  Color mycolorsIconsColor;

  Color mycolorsDetailsBackgroundColor;
  Color mycolorsDetailsDividerColor;
  Color mycolorsDetailsButtonsForgroundColor;
  Color mycolorsDetailsButtonsBackgroundColor;

  Color mycolorsSettingsTemplateFontColor;
  Color mycolorsSettingsTemplateContainerColor;
  Color mycolorsSettingsSliderthumbColor;
  Color mycolorsSettingContainersBordersColor;
  Color mycolorsSettingFontFamilyColor;
  Color mycolorsSelectedThemeBorderColor;
  MyAppTheme({
    required this.mycolorsAppBarsColor,
    required this.mycolorsPagesBackgroudColor,
    required this.mycolorsNavigationBarBackground,
    required this.mycolorsZakrCardColor,
    required this.mycolorsFontColor,
    required this.mycolorsIconsColor,
    required this.mycolorsDetailsBackgroundColor,
    required this.mycolorsDetailsDividerColor,
    required this.mycolorsDetailsButtonsForgroundColor,
    required this.mycolorsDetailsButtonsBackgroundColor,
    required this.mycolorsSettingsTemplateFontColor,
    required this.mycolorsSettingsTemplateContainerColor,
    required this.mycolorsSettingsSliderthumbColor,
    required this.mycolorsSettingContainersBordersColor,
    required this.mycolorsSettingFontFamilyColor,
    required this.mycolorsSelectedThemeBorderColor,
  });

  Map<String, dynamic> toJson() {
    return {
      'mycolorsAppBarsColor': mycolorsAppBarsColor.value,
      'mycolorsPagesBackgroudColor': mycolorsPagesBackgroudColor.value,
      'mycolorsNavigationBarBackground': mycolorsNavigationBarBackground.value,
      'mycolorsZakrCardColor': mycolorsZakrCardColor.value,
      'mycolorsFontColor': mycolorsFontColor.value,
      'mycolorsIconsColor': mycolorsIconsColor.value,
      'mycolorsDetailsBackgroundColor': mycolorsDetailsBackgroundColor.value,
      'mycolorsDetailsDividerColor': mycolorsDetailsDividerColor.value,
      'mycolorsDetailsButtonsForgroundColor':
          mycolorsDetailsButtonsForgroundColor.value,
      'mycolorsDetailsButtonsBackgroundColor':
          mycolorsDetailsButtonsBackgroundColor.value,
      'mycolorsSettingsTemplateFontColor':
          mycolorsSettingsTemplateFontColor.value,
      'mycolorsSettingsTemplateContainerColor':
          mycolorsSettingsTemplateContainerColor.value,
      'mycolorsSettingsSliderthumbColor':
          mycolorsSettingsSliderthumbColor.value,
      'mycolorsSettingContainersBordersColor':
          mycolorsSettingContainersBordersColor.value,
      'mycolorsSettingFontFamilyColor': mycolorsSettingFontFamilyColor.value,
      'mycolorsSelectedThemeBorderColor':
          mycolorsSelectedThemeBorderColor.value,
    };
  }

  factory MyAppTheme.fromJson(Map<String, dynamic> json) {
    return MyAppTheme(
      mycolorsAppBarsColor: Color(json['mycolorsAppBarsColor']),
      mycolorsPagesBackgroudColor: Color(json['mycolorsPagesBackgroudColor']),
      mycolorsNavigationBarBackground:
          Color(json['mycolorsNavigationBarBackground']),
      mycolorsZakrCardColor: Color(json['mycolorsZakrCardColor']),
      mycolorsFontColor: Color(json['mycolorsFontColor']),
      mycolorsIconsColor: Color(json['mycolorsIconsColor']),
      mycolorsDetailsBackgroundColor:
          Color(json['mycolorsDetailsBackgroundColor']),
      mycolorsDetailsDividerColor: Color(json['mycolorsDetailsDividerColor']),
      mycolorsDetailsButtonsForgroundColor:
          Color(json['mycolorsDetailsButtonsForgroundColor']),
      mycolorsDetailsButtonsBackgroundColor:
          Color(json['mycolorsDetailsButtonsBackgroundColor']),
      mycolorsSettingsTemplateFontColor:
          Color(json['mycolorsSettingsTemplateFontColor']),
      mycolorsSettingsTemplateContainerColor:
          Color(json['mycolorsSettingsTemplateContainerColor']),
      mycolorsSettingsSliderthumbColor:
          Color(json['mycolorsSettingsSliderthumbColor']),
      mycolorsSettingContainersBordersColor:
          Color(json['mycolorsSettingContainersBordersColor']),
      mycolorsSettingFontFamilyColor:
          Color(json['mycolorsSettingFontFamilyColor']),
      mycolorsSelectedThemeBorderColor:
          Color(json['mycolorsSelectedThemeBorderColor']),
    );
  }
}
