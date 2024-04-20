import 'package:azkar_alyam_y_allayla/dataModel.dart';
import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:azkar_alyam_y_allayla/provider/Fonts.dart';
import 'package:azkar_alyam_y_allayla/provider/zakrIndex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({
    Key? key,
    required this.detailscardIndex,
  }) : super(key: key);
  final int detailscardIndex;
  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  @override
  Widget build(BuildContext context) {
    final zakrcardIndex = Provider.of<ZakrIndex>(context).cardIndex;
    final fontsProvider = Provider.of<Fonts>(context, listen: false);
    final themeProvider = Provider.of<AppTheme>(context, listen: false);
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor:
            themeProvider.myAppTheme[0].mycolorsDetailsBackgroundColor,
      ),
      onPressed: usedListViewInsideDetails[zakrcardIndex][2]
                      [widget.detailscardIndex]
                  .counter ==
              0
          ? null
          : () {
              usedListViewInsideDetails[zakrcardIndex][2]
                      [widget.detailscardIndex]
                  .counter--;
              setState(() {});
            },
      child: Text(
        '${usedListViewInsideDetails[zakrcardIndex][2][widget.detailscardIndex].counter}',
        style: fontsProvider.textFamily700.copyWith(
            fontSize: (fontsProvider.fontSizeValue * 7).sp,
            color: themeProvider.myAppTheme[0].mycolorsFontColor),
      ),
    );
  }
}

class DetailsCardIcons extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  const DetailsCardIcons({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context, listen: false);
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor:
              themeProvider.myAppTheme[0].mycolorsDetailsBackgroundColor,
        ),
        child: Icon(
          icon,
          size: 27.h,
          color: themeProvider.myAppTheme[0].mycolorsFontColor,
        ));
  }
}

class DetailsCardText extends StatelessWidget {
  final String text;
  final double fontSize;
  const DetailsCardText({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontsProvider = Provider.of<Fonts>(context, listen: false);
    final themeProvider = Provider.of<AppTheme>(context, listen: false);
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: fontsProvider.textFamily700.copyWith(
        fontSize: (fontsProvider.fontSizeValue * fontSize).sp,
        color: themeProvider.myAppTheme[0].mycolorsNavigationBarBackground,
        letterSpacing: 0,
      ),
    );
  }
}
