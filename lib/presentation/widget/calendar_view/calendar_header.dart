import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/text_style.dart';

class CalendarHeader extends StatelessWidget {

  final String monthName;
  final Function forward;
  final Function backward;
  final Function monthClick;


  CalendarHeader(
    this.monthName,
    this.forward,
    this.backward,
    this.monthClick
  );



  /*CalendarHeader({Function forward, Function backward}) {

  };*/

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

        InkWell(
          onTap: (){
            backward();
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              'asset/images/ic_left.svg',
              allowDrawingOutsideViewBox: false,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            monthClick();
          },
          child: RichText(
            text: TextSpan(
                text: monthName,
                style: calenderMonthTitleStyle.copyWith(
                    color: Theme.of(context).colorScheme.primary)),
          ),
        ),
        InkWell(
          onTap: (){
            forward();
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              'asset/images/ic_right.svg',
              allowDrawingOutsideViewBox: false,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
