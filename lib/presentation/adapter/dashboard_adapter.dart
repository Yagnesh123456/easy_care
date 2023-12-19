import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_easy_care/presentation/theme/text_style.dart';

import '../../data/model/banner_messages.dart';
import '../widget/auto_wrap_text.dart';
import '../widget/card_with_shedow.dart.dart';
import '../widget/image_button.dart';


class DashboardAdapter extends StatelessWidget {
  BannerMessages dashboardMessage;

  DashboardAdapter(this.dashboardMessage);

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    return Card(
      margin: EdgeInsets.only(left: 16.0,right: 16.0,top: 12.0, bottom: 12.0),
     // radius: 10,
     // bgColor:Colors.grey[300],
     // margin: EdgeInsets.only(left: 8.0,right: 8.0,top: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top:16,bottom: 24.0,left: 12.0,right: 12.0),
              child: Row(
        mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // RichTextView('Banner Message',
                  // fontSize: 18,
                  // ),

                  RichText(text: TextSpan(
                      text: dashboardMessage.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color:Theme.of(context).colorScheme.onSurface
                      ),
                  ),
                      textScaleFactor: MediaQuery.of(context).textScaleFactor
                  ),


                  SvgPicture.asset(
                    dashboardMessage.type == "dashboard" ? "asset/images/ic_megaphonre_dark.svg" : "asset/images/ic_bookmark_dark.svg",
                    allowDrawingOutsideViewBox: false,
                      color:Theme.of(context).colorScheme.onBackground
                  ),
                ],
              ),
            ),


            Container(
              padding: EdgeInsets.only(top:4.0, bottom: 16.0,left: 12.0,right: 12.0),
              child: Text(dashboardMessage.text!,
                overflow: defaultTextStyle.overflow,
                maxLines: defaultTextStyle.maxLines,
                style: scheduleNote.copyWith(
                    color:Theme.of(context).colorScheme.onSurfaceVariant
                ) /*Theme.of(context).textTheme.titleSmall?.copyWith(
                    color:Theme.of(context).colorScheme.onSurfaceVariant
                )*/,)

              /*AutoWrapText('Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
                  ' Lorem Ipsum has been the industry s standard dummy text ever since the 1500s,'
                  ' when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              fontSize: 12,
              color: Colors.black45,
              ),*/
            )
          ],
        ),

      );

  }
}
