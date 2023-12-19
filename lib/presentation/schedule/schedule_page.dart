import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/presentation/adapter/calender_adapter.dart';
import 'package:go_easy_care/presentation/adapter/dashboard_adapter.dart';
import 'package:go_easy_care/presentation/schedule/schedule.dart';
import 'package:go_easy_care/presentation/schedule/schedule_all_details.dart';
import 'package:go_easy_care/presentation/theme/text_style.dart';
import 'package:go_easy_care/presentation/translations/language_constant.dart';
import 'package:go_easy_care/presentation/widget/calendar_view/month/go_easy_care_month_calendar.dart';
import 'package:go_easy_care/presentation/widget/calender_custom_view.dart';
import 'package:go_easy_care/presentation/widget/text_button.dart';
import 'package:go_easy_care/routes/app_routes.dart';
import 'package:go_easy_care/utils/Logger.dart';
import 'package:go_easy_care/utils/constants.dart';

import '../adapter/my_schedule_adapter.dart';
import '../adapter/schedule_adapter.dart';
import 'dart:math' as math;

import '../widget/calendar_view/week/go_easy_care_week_calendar.dart';
import '../widget/filter_dialog.dart';

class SchedulePage extends StatelessWidget {
  SchedulePage({Key? key}) : super(key: key);

  bool checkboxValueCity = false;
  List<String> allOptions = ['${ LANG_CONST.OPTION.toString().tr}1', '${ LANG_CONST.OPTION.toString().tr}2'];
  List<String> selectedOption = [];
  double width = MediaQuery.of(Get.context!).size.width-32;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              floating: true,
              pinned: false,
              delegate: _SliverAppBarDelegate(
                minHeight: 0.0,
                maxHeight: ((width/7)*2)+24+32.5+52,
                child: Wrap(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    GoEasyCareWeekCalendar( () {
                      _onMonthClick();
                    }),
                    InkWell(
                      onTap: (){
                        //_onFilterClick();
                      },
                      child: Align(
                        alignment:  Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.only(left: 12.0,right: 12.0,top: 8.0,bottom: 8.0),
                          margin: EdgeInsets.only(left: 8.0,right: 8.0, top: 16),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline,
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'asset/images/ic_filter_dark.svg',
                                allowDrawingOutsideViewBox: false,
                                color: Theme.of(context).colorScheme.primary,
                              ),

                              const SizedBox(
                                width: 8.0,
                              ),

                              RichText(text: TextSpan(
                                  text: LANG_CONST.FILTER.toString().tr,
                                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.onSurfaceVariant
                                  )),
                                  textScaleFactor: MediaQuery.of(context).textScaleFactor
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )

                //
                /*Container(
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      CalenderCustomView(
                        onMonthClickCallBack: _onMonthClick,
                        onFilterCallBack: _onFilterClick,
                      )
                    ],
                  ),
                )*/
                ,
              ),
            ),
          ];
        },
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, right: 16.0, bottom: 4.0, top: 8.0),
                    child: RichText(
                        text: TextSpan(
                            text:  LANG_CONST.MY_SCHEDULE.toString().tr,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface),),
                        textScaleFactor: MediaQuery.of(context).textScaleFactor),
                  ),
                ),
                MyScheduleAdapter(onTapCallBack: onTopCardTap),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 18.0, right: 16.0, bottom: 4.0, top: 8.0),
                  child: RichText(
                      text: TextSpan(
                          text:LANG_CONST.LOCATION_SCHEDULE.toString().tr,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface)),
                      textScaleFactor: MediaQuery.of(context).textScaleFactor),
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        // return  DashboardAdapter();
                        return ScheduleAdapter(
                          onTapCallBack: onCardTap,
                        );
                      },
                      itemCount: 10),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  onTopCardTap() {
    Get.to(ScheduleInformation());
  }

  onCardTap() {
    //  Get.to(ScheduleInformation());
    Get.to(ScheduleAllDetails());
  }

  _onMonthClick() {
    Logger.get().log("_onMonthClick");
    showMothCalenderDialog(Get.context!);
  }

  showMothCalenderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GoEasyCareMonthCalendar();
      },
    );
  }

  _onFilterClick() {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return FilterDialog(
              options: allOptions,
              selectedOptions: selectedOption,
              onSelectedOptionsListChanged: (cities) {
                selectedOption = cities;
                Logger.get().log("selectedOptions ===> ${selectedOption}");
              });
        });
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double? minHeight;
  final double? maxHeight;
  final Widget? child;

  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  @override
  double get minExtent => minHeight!;

  @override
  double get maxExtent => math.max(maxHeight!, minHeight!);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
