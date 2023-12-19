import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../data/model/schedule.dart';
import '../../../theme/text_style.dart';

class CalendarWeekView extends StatelessWidget {

  CalendarWeekView(this.startDateTime, this.listOfSchedule);

  final List<Schedule> listOfSchedule;
  final DateTime startDateTime;
  double width = MediaQuery.of(Get.context!).size.width - 32;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        7,
        (index) {
          DateTime newDateTime = startDateTime.add(Duration(days: index));
          Schedule schedule = listOfSchedule.firstWhere((element) => element.dateTime.year == newDateTime.year && element.dateTime.month == newDateTime.month && element.dateTime.day == newDateTime.day,
              orElse: () => Schedule(false, false, false, DateTime.now())
          );
          return Container(
            width: width / 7,
            height: width / 7,
            decoration: schedule == null ? null :
            schedule.isSelected ? BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ) :
            schedule.isCurrentDay ? BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.inverseSurface,
                width: 1.0,
              ),
            ) :
            null,

            alignment: Alignment.center,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      newDateTime.day.toString(),
                      style: calenderWeekDateStyle.copyWith(
                          color: schedule.isSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.inverseSurface),
                    ),
                ),
                if(schedule.isShift)
                Align(
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset(
                      'asset/images/ic_heart.svg',
                      allowDrawingOutsideViewBox: false,
                      color: Theme.of(context).colorScheme.primary,
                    )
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
