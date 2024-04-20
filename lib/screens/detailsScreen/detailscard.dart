// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:azkar_alyam_y_allayla/screens/detailsScreen/detailscardWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:azkar_alyam_y_allayla/dataModel.dart';
import 'package:azkar_alyam_y_allayla/helpers/spacer.dart';
import 'package:azkar_alyam_y_allayla/provider/AppTheme.dart';
import 'package:azkar_alyam_y_allayla/provider/zakrIndex.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    Key? key,
    required this.detailscardIndex,
  }) : super(key: key);
  final int detailscardIndex;
  @override
  Widget build(BuildContext context) {
    final zakrcardIndex = Provider.of<ZakrIndex>(context).cardIndex;
    final themeProvider = Provider.of<AppTheme>(context, listen: false);
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsCardText(
                text:
                    '${detailscardIndex + 1} - ${usedListViewInsideDetails[zakrcardIndex][2][detailscardIndex].contentTitle}',
                fontSize: 5),
            heightSpace(5),
            DetailsCardText(
                text:
                    '${usedListViewInsideDetails[zakrcardIndex][2][detailscardIndex].contentSubTitle}',
                fontSize: 3),
            heightSpace(10),
            Container(
              decoration: BoxDecoration(
                color: themeProvider.myAppTheme[0].mycolorsAppBarsColor,
                borderRadius: BorderRadiusDirectional.circular(10),
                border: Border.all(
                  color: themeProvider.myAppTheme[0].mycolorsFontColor,
                  width: 5,
                ),
              ),
              child: DetailsCardButtonsWidget(
                zakrcardIndex: zakrcardIndex,
                detailscardIndex: detailscardIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsCardButtonsWidget extends StatefulWidget {
  const DetailsCardButtonsWidget({
    super.key,
    required this.zakrcardIndex,
    required this.detailscardIndex,
  });

  final int zakrcardIndex;
  final int detailscardIndex;

  @override
  State<DetailsCardButtonsWidget> createState() =>
      _DetailsCardButtonsWidgetState();
}

class _DetailsCardButtonsWidgetState extends State<DetailsCardButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DetailsCardIcons(
            icon: Icons.share,
            onPressed: () {
              Share.share(
                  '﴿ ${usedListViewInsideDetails[widget.zakrcardIndex][0]} ﴾\n${usedListViewInsideDetails[widget.zakrcardIndex][2][widget.detailscardIndex].contentTitle} \n${usedListViewInsideDetails[widget.zakrcardIndex][2][widget.detailscardIndex].contentSubTitle}');
            }),
        SizedBox(
          width: 150.w,
          child: CounterButton(
            detailscardIndex: widget.detailscardIndex,
          ),
        ),
        DetailsCardIcons(
            icon: Icons.restart_alt,
            onPressed: () {
              usedListViewInsideDetails[widget.zakrcardIndex][2]
                      [widget.detailscardIndex]
                  .counter = usedListViewInsideDetails[widget.zakrcardIndex][2]
                      [widget.detailscardIndex]
                  .originalCounter;
              setState(() {});
            }),
      ],
    );
  }
}
