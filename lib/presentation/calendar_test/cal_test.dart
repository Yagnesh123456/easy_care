import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/presentation/widget/calendar_view/week/go_easy_care_week_calendar.dart';

import '../widget/calendar_view/month/go_easy_care_month_calendar.dart';

class CalTest extends StatelessWidget {
  CalTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 20.0, top: 20.0, bottom: 20.0),
            child: SvgPicture.asset(
              'asset/images/ic_close_light.svg',
              allowDrawingOutsideViewBox: false,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: "Schedule  Information",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
      ),
      body: GoEasyCareMonthCalendar(),
    );
  }
}
