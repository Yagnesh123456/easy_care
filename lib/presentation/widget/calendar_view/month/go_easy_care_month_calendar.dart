import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:go_easy_care/presentation/widget/calendar_view/calendar_header.dart';
import 'package:go_easy_care/presentation/widget/calendar_view/month/calendar_month_view.dart';
import 'package:go_easy_care/presentation/widget/calendar_view/week/calendar_week_view.dart';
import 'package:go_easy_care/presentation/widget/calendar_view/week/week_calendar_day_title.dart';

import '../../../../utils/constants.dart';
import '../../../adapter/calender_adapter.dart';
import '../../../calendar_test/calendar_controller.dart';
import '../../../theme/text_style.dart';
import 'month_calendar_day_title.dart';

class GoEasyCareMonthCalendar extends StatelessWidget {
  CalendarController controller = CalendarController();

  GoEasyCareMonthCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final childList = [CalendarWeek(controller.startDate.value), CalendarWeek(controller.startDate.value), CalendarWeek(controller.startDate.value)];

    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      insetPadding: EdgeInsets.only(left: 8.0, right: 8.0),
      contentPadding: EdgeInsets.all(16.0),
      content: Container(
        color: Theme.of(context).colorScheme.surface,
        //elevation: 0.0,
        margin: const EdgeInsets.all(0.0),
        child: ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: 100.0,
            maxHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => CalendarHeader(controller.monthName.value, () {
                  controller.nextMonth();
                }, () {
                  controller.previousMonth();
                }, () {}),
              ),
              SizedBox(
                height: 8,
              ),
              MonthCalendarDayTitle(),
              SizedBox(
                height: 0,
              ),
              Obx(() => CalendarMonthView(
                controller.month.value,
                controller.totalDays.value,
                controller.scheduleList,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class GoEasyCareMonthCalendar extends StatelessWidget {
  CalendarController controller = CalendarController();
  final PageController _pageController = PageController(initialPage: 999);

  GoEasyCareMonthCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      insetPadding: EdgeInsets.only(left: 8.0, right: 8.0),
      contentPadding: EdgeInsets.all(16.0),
      content: Container(
        color: Theme.of(context).colorScheme.surface,
        margin: const EdgeInsets.all(0.0),
        child: ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: 100.0,
            maxHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => CalendarHeader(controller.monthName.value, () {
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 500), curve: Curves.ease);
                }, () {
                  _pageController.previousPage(
                      duration: Duration(milliseconds: 500), curve: Curves.ease);
                }, () {}),
              ),
              SizedBox(
                height: 8,
              ),
              MonthCalendarDayTitle(),
              SizedBox(
                height: 0,
              ),
              Container(
                height: 350,
                child: PageView.builder(
                  onPageChanged: (index) {
                    print("Page Index: " + index.toString());
                  },
                  controller: _pageController,
                  //itemCount: childList.length,
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (BuildContext context, int index) {

                    var newMonth = DateTime(controller.month.value.year, controller.month.value.month + (index-999));
                    print("Year: " + newMonth.year.toString()+", Month: "+newMonth.month.toString());
                    return CalendarMonthView(
                      newMonth,
                      controller.scheduleList,
                    );
                    //return CalendarWeek(controller.startDate.value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */
