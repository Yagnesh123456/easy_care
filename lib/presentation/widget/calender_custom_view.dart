import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/presentation/adapter/calender_adapter.dart';
import 'package:go_easy_care/presentation/theme/text_style.dart';
import 'package:go_easy_care/presentation/translations/language_constant.dart';
import 'package:go_easy_care/utils/Logger.dart';
import 'package:go_easy_care/utils/constants.dart';

import '../widget/card_with_shedow.dart.dart';
import '../widget/color_dot.dart';
import '../widget/profile_image.dart';

class CalenderCustomView extends StatelessWidget {
  Function? onTapCallBack;
  Function? onMonthClickCallBack;
  Function? onFilterCallBack;

  CalenderCustomView({Key? key,
    this.onTapCallBack,
    this.onMonthClickCallBack,
    this.onFilterCallBack
  }) : super(key: key);

  // List<String> dummyData = ['12','13','14','15','16','17','18','19'];
  // List<String> dummyDataWeek = ['S','M','T','W','T','F','S','S'];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 32;
    Logger.get().log('width===>$width');
    return InkWell(
      onTap: () {
        if (onTapCallBack != null) {
          onTapCallBack!();
        }
      },
      child: Container(
        // padding: const EdgeInsets.all(16.0),
        padding:
            EdgeInsets.only(left: 8.0, top: 8.0, bottom: 0.0, right: 8.0),
        child: Wrap(
          clipBehavior: Clip.antiAlias,
          children: [
            Column(
              children: [
                Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'asset/images/ic_left.svg',
                        allowDrawingOutsideViewBox: false,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      InkWell(
                        onTap: (){
                          if(onMonthClickCallBack != null){
                            onMonthClickCallBack!();
                          }

                        },
                        child: RichText(
                          text: TextSpan(
                              text:  LANG_CONST.JULY_2021.toString().tr,
                              style: calenderMonthTitleStyle.copyWith(
                                  color: Theme.of(context).colorScheme.primary)),
                            textScaleFactor: MediaQuery.of(context).textScaleFactor
                        ),
                      ),
                      SvgPicture.asset(
                        'asset/images/ic_right.svg',
                        allowDrawingOutsideViewBox: false,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 60.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return  CalenderAdapter(
                            dummyDataWeek[index]

                        );
                        // return  ScheduleAdapter();
                      },
                      itemCount: 8),
                ),


        Container(
          height: 60.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return  CalenderAdapter(
                    dummyData[index]

                );
                // return  ScheduleAdapter();
              },
              itemCount: 8),
        ),


                InkWell(
                  onTap: (){
                    if(onFilterCallBack != null){
                      onFilterCallBack!();
                      Logger.get().log('Filter click detect');
                    }
                  },
                  child: Align(
                    alignment:  Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.only(left: 12.0,right: 12.0,top: 8.0,bottom: 8.0),
                      margin: EdgeInsets.only(left: 8.0,right: 8.0,top: 16.0),
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
                              text:  LANG_CONST.FILTER.toString().tr,
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
            ),
          ],
        ),
      ),
     );
  }
}
