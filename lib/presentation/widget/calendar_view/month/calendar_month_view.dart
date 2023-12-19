import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../data/model/schedule.dart';
import '../../../theme/text_style.dart';
import 'dart:math' as math;

class CalendarMonthView extends StatelessWidget {
  CalendarMonthView(this.month, this.totalDaysInMonth, this.listOfSchedule);

  final DateTime month;
  final int totalDaysInMonth;
  final List<Schedule> listOfSchedule;
  double width = MediaQuery.of(Get.context!).size.width - 32 - 16;

  @override
  Widget build(BuildContext context) {
    

    
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemCount: month.weekday == 7 ? 35 : (month.weekday + totalDaysInMonth) >= 36 ? 42 : 35,
          itemBuilder: (BuildContext context, int index) {

            var text = "";

            var day = 0;

            if(month.weekday <= 6)
              day = (index+1) - month.weekday;
            else
              day = (index+1);


            Schedule schedule = listOfSchedule.firstWhere((element) => element.dateTime.year == month.year && element.dateTime.month == month.month && element.dateTime.day == day,
                orElse: () => Schedule(false, false, false, DateTime.now())
            );

            if(day >= 1 && (day <= totalDaysInMonth)) {
              text = day.toString();

            } else {
              text = "";
            }


            return Container(
              width: width / 7,
              height: width / 7,
              alignment: Alignment.center,
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
              child:
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      text,
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
              /*Text(

                text,
                *//*newDateTime.day.toString(),*//*
                style: calenderWeekDateStyle.copyWith(
                    color: Theme.of(context).colorScheme.inverseSurface),
              ),*/
            );
          }),
    );
  }
}


/*
class CalendarMonthView extends StatelessWidget {
  CalendarMonthView(this.month, this.listOfSchedule);

  final DateTime month;
  int totalDaysInMonth = 0;
  final List<Schedule> listOfSchedule;

  @override
  Widget build(BuildContext context) {


    totalDaysInMonth = lastDayOfMonth(month);
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemCount: month.weekday == 7 ? 35 : (month.weekday + totalDaysInMonth) >= 36 ? 42 : 35,
          itemBuilder: (BuildContext context, int index) {

            var text = "";

            var day = 0;

            if(month.weekday <= 6)
              day = (index+1) - month.weekday;
            else
              day = (index+1);


            Schedule schedule = listOfSchedule.firstWhere((element) => element.dateTime.year == month.year && element.dateTime.month == month.month && element.dateTime.day == day,
                orElse: () => Schedule(false, false, false, DateTime.now())
            );

            if(day >= 1 && (day <= totalDaysInMonth)) {
              text = day.toString();

            } else {
              text = "";
            }


            return Container(
              alignment: Alignment.center,
              decoration:
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
              child:
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      text,
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
          }),
    );
  }

  int lastDayOfMonth(DateTime month) {
    var beginningNextMonth = (month.month < 12)
        ? new DateTime(month.year, month.month + 1, 1)
        : new DateTime(month.year + 1, 1, 1);
    return beginningNextMonth.subtract(new Duration(days: 1)).day;
  }
}

 */
