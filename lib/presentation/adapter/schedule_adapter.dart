import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/presentation/translations/language_constant.dart';

import '../theme/text_style.dart';
import '../translations/language_constant.dart';
import '../widget/card_with_shedow.dart.dart';
import '../widget/color_dot.dart';
import '../widget/profile_image.dart';

class ScheduleAdapter extends StatelessWidget {

  Function? onTapCallBack;
   ScheduleAdapter({Key? key,this.onTapCallBack}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTapCallBack != null){
          onTapCallBack!();
        }
      },
      child: Card(
        margin: EdgeInsets.only(left: 8.0,right: 8.0,top: 6.0,bottom: 6.0),
          child: Container(

            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ProfileImage(
                  size: 40,
                  fontSize: 24,
                  url: 'T',
                  imageWithBackground: true,
                  backGroundColor:
                  Theme.of(context).colorScheme.primary,
                  borderColor: Theme.of(context).colorScheme.primary,
                ),

                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 16.0,right: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 6.0,
                        ),

                        RichText(text: TextSpan(
                          text:  LANG_CONST.EMPLOYEE_NAME.toString().tr,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface
                          )
                        ),
                            textScaleFactor: MediaQuery.of(context).textScaleFactor
                        ),

                        SizedBox(
                          height: 8.0,
                        ),
                        /*RichText('Employee Name',
                        fontSize: 16,
                        ),*/


                        RichText(text: TextSpan(
                            text:  LANG_CONST.LOCATION_NAME.toString().tr,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface
                            )
                        ),
                            textScaleFactor: MediaQuery.of(context).textScaleFactor
                        ),

                        SizedBox(
                          height: 8.0,
                        ),


                        /*RichTextView('Location Name',
                          fontSize: 14,
                          margin: EdgeInsets.only(top:4.0),
                        ),*/

                        RichText(text: TextSpan(
                            text:  LANG_CONST.SHIFT_NAME.toString().tr,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface
                            )
                        ),
                            textScaleFactor: MediaQuery.of(context).textScaleFactor
                        ),

                        const SizedBox(
                          height: 6.0,
                        ),

                        /*RichTextView('Shift Name',
                          fontSize: 14,
                          margin: const EdgeInsets.only(top:4.0),
                        ),*/

                      ],
                    ),
                  ),
                ),

                // RichTextView('00:00 - 00:00',
                // fontSize: 14,
                //   margin: EdgeInsets.only(right: 4.0,left: 0.0),
                // ),

                RichText(text: TextSpan(
                    text: "${'00_00'.tr} - ${'00_00'.tr}",
                    style: overlineTextStyle.copyWith(
                        color: Theme.of(context).colorScheme.onSurface
                    )
                ),
                    textScaleFactor: MediaQuery.of(context).textScaleFactor
                ),

                const SizedBox(
                  width: 4.0,
                ),



                ColorDot(
                  height: 12.0,
                  width: 12.0,
                  color: Color(0XFF45EA0B),
                  margin:EdgeInsets.only(right: 4.0,left: 8.0) ,
                )
              ],
            ),
          ),

        ),
    );

  }
}
