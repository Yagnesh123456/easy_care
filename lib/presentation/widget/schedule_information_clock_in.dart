import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/presentation/translations/language_constant.dart';

import '../translations/language_constant.dart';
import '../widget/card_with_shedow.dart.dart';
import '../widget/color_dot.dart';
import '../widget/profile_image.dart';

class ScheduleInformationClockIn extends StatelessWidget {

  Function? onTapCallBack;
  String? text ;
   ScheduleInformationClockIn({Key? key,this.onTapCallBack,this.text = 'Employee Name'}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTapCallBack != null){
          onTapCallBack!();
        }
      },
      child: Card(
        margin: EdgeInsets.only(left: 16,right: 16,top: 4.0,bottom: 4.0),
          child: Container(
           // padding: const EdgeInsets.all(16.0),
            padding: EdgeInsets.only(left:16.0,top: 16.0,bottom: 16.0,right: 8.0),
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


                const SizedBox(
                  width: 4.0,
                ),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(text: TextSpan(
                              text: text,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface
                              )
                            ),
                                textScaleFactor: MediaQuery.of(context).textScaleFactor
                            ),


                            const SizedBox(
                              height: 4.0,
                            ),


                            RichText(text: TextSpan(
                                text:  LANG_CONST.CLOCKED_IN.toString().tr,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurface
                                )
                            ),
                                textScaleFactor: MediaQuery.of(context).textScaleFactor
                            ),



                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(text: TextSpan(
                                text:  LANG_CONST.DATE_JUNE_19_2022.toString().tr,
                                style: Theme.of(context).textTheme.caption?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurface
                                )
                            ),
                                textScaleFactor: MediaQuery.of(context).textScaleFactor
                            ),

                            const SizedBox(
                              height: 2.0,
                            ),

                            RichText(text: TextSpan(
                                text:  LANG_CONST.T9_25_am.toString().tr,
                                style: Theme.of(context).textTheme.caption?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurface
                                )
                            ),
                                textScaleFactor: MediaQuery.of(context).textScaleFactor
                            ),

                            const SizedBox(
                              height: 4.0,
                            ),


                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

        ),
    );

  }
}
