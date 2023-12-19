import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_easy_care/data/model/schedule.dart';

import '../theme/text_style.dart';

class CalendarItem extends StatelessWidget {
  final Schedule schedule;
  final double wh;

  CalendarItem(this.schedule, this.wh);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: wh,
      width: wh,
      decoration: schedule.isSelected? fillCircle : schedule.isCurrentDay? borderCircle : null,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              schedule.dateTime.day.toString(),
              style: calenderWeekDateStyle.copyWith(
                  color: schedule.isSelected
                      ?  Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.inverseSurface
              ),
            ),
          ),
          if (schedule.isShift)
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 4),
              child: SvgPicture.asset(
                'asset/images/ic_heart.svg',
                allowDrawingOutsideViewBox: false,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
        ],
      ),
    );
  }
}
