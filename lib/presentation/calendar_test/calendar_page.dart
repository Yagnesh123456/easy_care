import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/presentation/dashboard/dashboard_page.dart';
import 'package:go_easy_care/presentation/login/login_page.dart';
import 'package:go_easy_care/presentation/profile/profile_page.dart';
import 'package:go_easy_care/presentation/schedule/schedule_page.dart';
import 'package:go_easy_care/presentation/theme/color.dart';
import 'package:go_easy_care/presentation/theme/text_style.dart';
import 'package:go_easy_care/presentation/widget/profile_image.dart';

import '../widget/calendar_item.dart';
import 'calendar_controller.dart';

class CalendarPage extends StatelessWidget {
  CalendarController ccon = CalendarController();

  Column getDateWidget() {

    List<Widget> childList = List.empty(growable: true);
    //Widget childList = Column(children: list);

    List<String> names = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

    for (var i = 0; i <= 7; i++) {
      var displayDate = ccon.startDate.add(Duration(days: i));
      childList.add(Text(displayDate.day.toString()+"("+names[displayDate.weekday-1]+")",
      style: TextStyle(color: Colors.black, fontSize: 24),

      ));
    }

    return Column(children: childList);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        // this._context = context;
        return SingleChildScrollView(

          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,

                children: <Widget>[
               //   CalendarItem(),
                  Obx(
                    () => getDateWidget(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //ccon.forward();
                    },
                    child: Text("Forward", style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //ccon.backward();
                    },
                    child: Text("Backward", style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
