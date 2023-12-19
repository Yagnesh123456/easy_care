import 'package:flutter/material.dart';
import 'package:get/get.dart';



var calenderMonthTitleStyle = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
  fontFamily: 'Inter-Regular',
);


var calenderWeekDayStyle = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  fontSize: 16.0,
  fontFamily: 'Inter-Regular',
);

var calenderWeekDateStyle = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 16.0,
  fontFamily: 'Inter-Regular',
);

var loginLableStyle = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  fontSize: 24.0,
  fontFamily: 'SF-Pro-Rounded',
  //fontFamily: GoogleFonts.tajawal().fontFamily,
);

var scheduleDateStyle = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 11.0,
  fontFamily: 'Roboto-Regular',
  letterSpacing: 0.5,
);

var scheduleNote = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 14.0,
  fontFamily: 'Roboto-Regular',
  letterSpacing: 0.25,
);

var overlineTextStyle = TextStyle(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  fontSize: 12.0,
  fontFamily: 'Roboto-Regular',
  letterSpacing: 0.5
);

var drawerTitleStyle = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
    fontFamily: 'Roboto-Regular',
    letterSpacing: 0.1
);
//TextField

var loginEnabledBorder = OutlineInputBorder(
  //  borderRadius: BorderRadius.all(Radius.circular(4)),
  borderSide: BorderSide(width: 1,color: Theme.of(Get.context!).colorScheme.outline),
);
var alertDialogueEnabledBorder = UnderlineInputBorder(
  //  borderRadius: BorderRadius.all(Radius.circular(4)),
  borderSide: BorderSide(width: 1,color: Theme.of(Get.context!).colorScheme.outline),
);

var profileEnabledBorder = OutlineInputBorder(
  //  borderRadius: BorderRadius.all(Radius.circular(4)),
  borderSide: BorderSide(width: 1,color: Theme.of(Get.context!).colorScheme.onSurfaceVariant.withOpacity(0.12)),
);

//decoration
var borderCircle = BoxDecoration(
  shape: BoxShape.circle,
  border: Border.all(
    color: Theme.of(Get.context!).colorScheme.inverseSurface,
    width: 1.0,
  ),
);

var fillCircle = BoxDecoration(
  shape: BoxShape.circle,
  color: Theme.of(Get.context!).colorScheme.primary,
);

