import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/presentation/translations/language_constant.dart';

import '../theme/text_style.dart';
import '../translations/language_constant.dart';
import '../widget/card_with_shedow.dart.dart';
import '../widget/color_dot.dart';
import '../widget/profile_image.dart';

class MyScheduleAdapter extends StatelessWidget {

  Function? onTapCallBack;
   MyScheduleAdapter({Key? key,this.onTapCallBack}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTapCallBack != null){
          onTapCallBack!();
        }
      },
      child: Card(
        margin: EdgeInsets.only(left: 8.0,right: 8.0,top: 4.0,bottom: 4.0),
          child: Container(

            padding: const EdgeInsets.only(left:8.0,right: 8.0,top:14.0,bottom: 14.0),
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
                        RichText(text: TextSpan(
                          text:  LANG_CONST.LOCATION_NAME.toString().tr,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface
                          )
                        ),
                        textScaleFactor: MediaQuery.of(context).textScaleFactor
                        ),

                        const SizedBox(
                          height: 6.0,
                        ),

                        RichText(text: TextSpan(
                            text:  LANG_CONST.SHIFT_NAME.toString().tr,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                ),


                RichText(text: TextSpan(
                    text: "${LANG_CONST.ZERO_ZERO.toString().tr} - ${ LANG_CONST.ZERO_ZERO.toString().tr}",
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
                  color: Theme.of(context).colorScheme.outline,
                  margin:EdgeInsets.only(right: 4.0,left: 8.0) ,
                )
              ],
            ),
          ),

        ),
    );

  }
}
