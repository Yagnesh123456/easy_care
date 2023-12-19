import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_easy_care/presentation/theme/text_style.dart';

import '../widget/card_with_shedow.dart.dart';
import '../widget/color_dot.dart';
import '../widget/profile_image.dart';

class CalenderAdapter extends StatelessWidget {
  Function? onTapCallBack;
  String data;
  bool isCircle = false;
  bool isFullCircleBg = false;
  bool isHeartEnable = false;

  CalenderAdapter(this.data, {Key? key, this.onTapCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 32;

    if (data == '13') {
      isCircle = true;
    } else {
      isCircle = false;
    }

    if (data == '14' || data == '15') {
      isHeartEnable = true;
    } else {
      isHeartEnable = false;
    }

    if (data == '17') {
      isFullCircleBg = true;
    } else {
      isFullCircleBg = false;
    }
    return InkWell(
      onTap: () {
        if (onTapCallBack != null) {
          onTapCallBack!();
        }
      },
      child: Container(
        width: width / 8,
        decoration: isFullCircleBg
            ? BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              )
            : isCircle
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      width: 1.0,
                    ),
                  )
                : null,
        // decoration: isCircle ? BoxDecoration(
        //   shape: BoxShape.circle,
        //   border:  Border.all(
        //     color: Colors.black,
        //     width: 1.0,
        //   ),
        // ) : null,
        //height:width / 8 ,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 10.0,
              ),
              RichText(
                text: TextSpan(
                    text: data,
                    style:  calenderWeekDateStyle.copyWith(
                      color: isFullCircleBg
                          ?  Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.inverseSurface
                    )
                    /*style: Theme.of(context).textTheme.button?.copyWith(
                        color: isFullCircleBg
                            ?  Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.inverseSurface)*/),
                  textScaleFactor: MediaQuery.of(context).textScaleFactor
              ),
              SizedBox(
                height: 2.0,
              ),
              isHeartEnable
                  ? SvgPicture.asset(
                      'asset/images/ic_heart.svg',
                      allowDrawingOutsideViewBox: false,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : Container(
                      height: 8.0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
