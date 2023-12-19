import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/text_style.dart';
import '../../../theme/text_style.dart';

class MonthCalendarDayTitle extends StatelessWidget {
  final daysTitles = ["S", "M", "T", "W", "T", "F", "S"];

  MonthCalendarDayTitle({Key? key}) : super(key: key);

  double width = MediaQuery.of(Get.context!).size.width-32-16;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: daysTitles
            .map(
              (item) => Container(
                alignment: Alignment.center,
                width: width/7,
                height: width/7,
                child: Text(
                  item,
                  style: calenderWeekDayStyle.copyWith(
                      color: Theme.of(context).colorScheme.inverseSurface),
                ),
              ),
            )
            .toList());
  }
}
