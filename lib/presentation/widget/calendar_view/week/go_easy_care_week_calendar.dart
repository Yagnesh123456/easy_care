import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:go_easy_care/data/model/schedule.dart';
import 'package:go_easy_care/presentation/widget/calendar_view/calendar_header.dart';
import 'package:go_easy_care/presentation/widget/calendar_view/week/calendar_week_view.dart';
import 'package:go_easy_care/presentation/widget/calendar_view/week/week_calendar_day_title.dart';
import 'package:get/get.dart';
import '../../../calendar_test/calendar_controller.dart';
import 'dart:math' as math;

class GoEasyCareWeekCalendar extends StatelessWidget {
  CalendarController controller = CalendarController();
  final PageController _pageController = PageController(initialPage: 999);
  double width = MediaQuery.of(Get.context!).size.width - 32;

  final Function monthClicked;

  GoEasyCareWeekCalendar(this.monthClicked, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final childList = [CalendarWeek(controller.startDate.value), CalendarWeek(controller.startDate.value), CalendarWeek(controller.startDate.value)];
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Obx(
            () => CalendarHeader(
              controller.monthName.value,
              () {
                //pageController.animateToPage(2, duration: Duration(microseconds: 0), curve: Curve())
                //controller.forward();
                _pageController.nextPage(
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
              () {
                //controller.backward();
                _pageController.previousPage(
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
              () {
                monthClicked();
              },
            ),
          ),

          Container(
            //decoration: BoxDecoration(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
            height: width / 3.5,
            child: PageView.builder(
              onPageChanged: (index) {
                print("Page Index: " + index.toString());
                controller.changeIndex(index);
              },
              controller: _pageController,
              //itemCount: childList.length,
              scrollDirection: Axis.horizontal,

              itemBuilder: (BuildContext context, int index) {
                print("Index: " + index.toString());
                return Column(
                  children: [
                    WeekCalendarDayTitle(),
                    CalendarWeekView(controller.startDate
                        .add(Duration(days: (index - 999) * 7)), controller.scheduleList)
                  ],
                );
                //return CalendarWeek(controller.startDate.value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
