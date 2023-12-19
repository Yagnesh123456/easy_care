import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/presentation/adapter/dashboard_adapter.dart';
import 'package:go_easy_care/presentation/schedule/schedule.dart';
import 'package:go_easy_care/presentation/schedule/schedule_all_details.dart';
import 'package:go_easy_care/presentation/translations/language_constant.dart';
import 'package:go_easy_care/presentation/widget/calender_custom_view.dart';
import 'package:go_easy_care/presentation/widget/color_dot.dart';
import 'package:go_easy_care/presentation/widget/profile_image.dart';
import 'package:go_easy_care/routes/app_routes.dart';

import '../adapter/my_schedule_adapter.dart';
import '../adapter/schedule_adapter.dart';
import 'dart:math' as math;

class TimerPage extends StatelessWidget {
   TimerPage({Key? key}) : super(key: key);
  double borderRadius = 50.0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 32;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // appBar: AppBar(
      //   title: RichText(
      //       text: TextSpan(
      //           text: 'Time Clock Quick Link',
      //           style: Theme.of(context).textTheme.titleLarge?.copyWith(
      //               color: Theme.of(context).colorScheme.onSurface)),
      //     ),
      // ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
          headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
          ];
        },
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 16.0,bottom: 4.0,top:8.0),
                  child: RichText(text: TextSpan(
                      text:  LANG_CONST.TODAYS_SHIFT.toString().tr,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface
                      )),
                      textScaleFactor: MediaQuery.of(context).textScaleFactor
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //location name, image & status
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            //profile image
                            ProfileImage(
                              url: 'A',
                              size: 40,
                              backGroundColor:
                              Theme.of(context).colorScheme.primary,
                              borderColor: Theme.of(context).colorScheme.primary,
                            ),

                            const SizedBox(
                              width: 16.0,
                            ),

                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text:  LANG_CONST.LOCATION_NAME.toString().tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface)),
                                      textScaleFactor: MediaQuery.of(context).textScaleFactor
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text:  LANG_CONST.SHIFT_NAME.toString().tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface)),
                                      textScaleFactor: MediaQuery.of(context).textScaleFactor
                                  ),
                                ],
                              ),
                            ),

                            ColorDot(
                              height: 12.0,
                              width: 12.0,
                              color: Theme.of(context).colorScheme.outline,
                              margin: EdgeInsets.only(right: 4.0, left: 8.0),
                            )
                          ],
                        ),

                        //space
                        const SizedBox(
                          height: 24,
                        ),

                        //shift start
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: RichText(
                                  text: TextSpan(
                                      text:  LANG_CONST.SHIFT_START_IN.toString().tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant)),
                                  textScaleFactor: MediaQuery.of(context).textScaleFactor
                              ),
                            ),

                            const SizedBox(
                              width: 8.0,
                            ),

                            RichText(
                                text: TextSpan(
                                    text:  LANG_CONST.MINUTES_30.toString().tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant)),
                                textScaleFactor: MediaQuery.of(context).textScaleFactor
                            ),

                            const SizedBox(
                              width: 16.0,
                            ),

                          ],
                        ),

                        //space
                        const SizedBox(
                          height: 10,
                        ),

                        //distance location
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: RichText(
                                  text: TextSpan(
                                      text:  LANG_CONST.DISTANCE_FROM_LOCATION.toString().tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant)),
                                  textScaleFactor: MediaQuery.of(context).textScaleFactor
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            RichText(
                                text: TextSpan(
                                    text:  LANG_CONST.KM_16.toString().tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant)),
                                textScaleFactor: MediaQuery.of(context).textScaleFactor
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                          ],
                        ),

                        //space
                        const SizedBox(
                          height: 24,
                        ),

                        RichText(
                            text: TextSpan(
                                text: LANG_CONST.JUNE_19_2022.toString().tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface)),
                            textScaleFactor: MediaQuery.of(context).textScaleFactor
                        ),

                        //space
                        const SizedBox(
                          height: 40,
                        ),

                        //start time, end Time
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 4,
                                ),
                                RichText(
                                    text: TextSpan(
                                        text:  LANG_CONST.START_TIME.toString().tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurfaceVariant)),
                                    textScaleFactor: MediaQuery.of(context).textScaleFactor
                                ),
                                // const SizedBox(
                                //   height: 6,
                                // ),
                                RichText(
                                    text: TextSpan(
                                        text:  LANG_CONST.TEN_10_00.toString().tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurfaceVariant)),
                                    textScaleFactor: MediaQuery.of(context).textScaleFactor
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 4,
                                ),
                                RichText(
                                    text: TextSpan(
                                        text:  LANG_CONST.END_TIME.toString().tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurfaceVariant)),
                                    textScaleFactor: MediaQuery.of(context).textScaleFactor
                                ),
                                // const SizedBox(
                                //   height: 6,
                                // ),
                                RichText(
                                    text: TextSpan(
                                        text:  LANG_CONST.T22_00.toString().tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurfaceVariant)),
                                    textScaleFactor: MediaQuery.of(context).textScaleFactor
                                ),
                              ],
                            )
                          ],
                        ),

                        //space
                        const SizedBox(
                          height: 24,
                        ),

                        //Report and Clock in
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Get.offNamed((AppRoutes.HOME));
                              },
                              style: Theme.of(context)
                                  .elevatedButtonTheme
                                  .style
                                  ?.copyWith(
                                padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                                  const EdgeInsets.only(left: 16,right: 16,top: 12.0,bottom: 12.0),
                                ),
                                minimumSize:
                                ButtonStyleButton.allOrNull<Size>(
                                  const Size(
                                    0,
                                    0,
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context)
                                        .colorScheme
                                        .surfaceVariant),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(borderRadius),
                                      side: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                          width: 1,
                                          style: BorderStyle.solid)
                                    //side: BorderSide(color: borderColor!),
                                  ),
                                ),
                              ),
                              child: Text( LANG_CONST.REPORT_ABSENCE.toString().tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary)),
                            ),
                            //space
                            const SizedBox(
                              width: 12.0,
                            ),

                            ElevatedButton(
                              onPressed: () {
                               // showAlertDialog(context);
                              },
                              style: Theme.of(context)
                                  .elevatedButtonTheme
                                  .style
                                  ?.copyWith(

                                padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                                  const EdgeInsets.only(left: 16,right: 16,top: 12.0,bottom: 12.0),
                                ),
                                minimumSize:
                                ButtonStyleButton.allOrNull<Size>(
                                  const Size(
                                    0,
                                    0,
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).colorScheme.primary),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(borderRadius),
                                    //side: BorderSide(color: borderColor!),
                                  ),
                                ),
                              ),
                              child: Text(
                                LANG_CONST.CLOCK_IN.toString().tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Card(
                //   child: Container(
                //     padding: EdgeInsets.all(16.0),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         //location name, image & status
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           mainAxisSize: MainAxisSize.max,
                //           children: [
                //             //profile image
                //             ProfileImage(
                //               url: 'A',
                //               size: 40,
                //               backGroundColor:
                //               Theme.of(context).colorScheme.primary,
                //               borderColor: Theme.of(context).colorScheme.primary,
                //             ),
                //
                //             const SizedBox(
                //               width: 16.0,
                //             ),
                //
                //             Expanded(
                //               child: Column(
                //                 mainAxisSize: MainAxisSize.min,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   RichText(
                //                       text: TextSpan(
                //                           text: "Location Name",
                //                           style: Theme.of(context)
                //                               .textTheme
                //                               .titleMedium
                //                               ?.copyWith(
                //                               color: Theme.of(context)
                //                                   .colorScheme
                //                                   .onSurface)),
                //                       textScaleFactor: MediaQuery.of(context).textScaleFactor
                //                   ),
                //                   SizedBox(
                //                     height: 6.0,
                //                   ),
                //                   RichText(
                //                       text: TextSpan(
                //                           text: "Shift Name",
                //                           style: Theme.of(context)
                //                               .textTheme
                //                               .bodyMedium
                //                               ?.copyWith(
                //                               color: Theme.of(context)
                //                                   .colorScheme
                //                                   .onSurface)),
                //                       textScaleFactor: MediaQuery.of(context).textScaleFactor
                //                   ),
                //                 ],
                //               ),
                //             ),
                //
                //             ColorDot(
                //               height: 12.0,
                //               width: 12.0,
                //               color: Theme.of(context).colorScheme.outline,
                //               margin: EdgeInsets.only(right: 4.0, left: 8.0),
                //             )
                //           ],
                //         ),
                //
                //         //space
                //         const SizedBox(
                //           height: 24,
                //         ),
                //
                //         //shift start
                //         Row(
                //           mainAxisSize: MainAxisSize.max,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Expanded(
                //               child: RichText(
                //                   text: TextSpan(
                //                       text: "Shift start in",
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .bodyLarge
                //                           ?.copyWith(
                //                           color: Theme.of(context)
                //                               .colorScheme
                //                               .onSurfaceVariant)),
                //                   textScaleFactor: MediaQuery.of(context).textScaleFactor
                //               ),
                //             ),
                //
                //             const SizedBox(
                //               width: 8.0,
                //             ),
                //
                //             RichText(
                //                 text: TextSpan(
                //                     text: "30 minutes",
                //                     style: Theme.of(context)
                //                         .textTheme
                //                         .bodyLarge
                //                         ?.copyWith(
                //                         color: Theme.of(context)
                //                             .colorScheme
                //                             .onSurfaceVariant)),
                //                 textScaleFactor: MediaQuery.of(context).textScaleFactor
                //             ),
                //
                //             const SizedBox(
                //               width: 16.0,
                //             ),
                //
                //             // RichTextView(
                //             //   'Shift start in ',
                //             //   fontSize: 14.0,
                //             //   margin: EdgeInsets.only(top: 4.0),
                //             // ),
                //             // RichTextView(
                //             //   '30 minutes',
                //             //   fontSize: 14.0,
                //             //   margin: EdgeInsets.only(top: 4.0, right: 8.0),
                //             // ),
                //           ],
                //         ),
                //
                //         //space
                //         const SizedBox(
                //           height: 10,
                //         ),
                //
                //         //distance location
                //         Row(
                //           mainAxisSize: MainAxisSize.max,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Expanded(
                //               child: RichText(
                //                   text: TextSpan(
                //                       text: "Distance from Location :",
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .bodyLarge
                //                           ?.copyWith(
                //                           color: Theme.of(context)
                //                               .colorScheme
                //                               .onSurfaceVariant)),
                //                   textScaleFactor: MediaQuery.of(context).textScaleFactor
                //               ),
                //             ),
                //             const SizedBox(
                //               width: 8.0,
                //             ),
                //             RichText(
                //                 text: TextSpan(
                //                     text: "16 km",
                //                     style: Theme.of(context)
                //                         .textTheme
                //                         .bodyLarge
                //                         ?.copyWith(
                //                         color: Theme.of(context)
                //                             .colorScheme
                //                             .onSurfaceVariant)),
                //                 textScaleFactor: MediaQuery.of(context).textScaleFactor
                //             ),
                //             const SizedBox(
                //               width: 16.0,
                //             ),
                //           ],
                //         ),
                //
                //         //space
                //         const SizedBox(
                //           height: 24,
                //         ),
                //
                //         RichText(
                //             text: TextSpan(
                //                 text: "June 19, 2022",
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .bodyLarge
                //                     ?.copyWith(
                //                     color: Theme.of(context)
                //                         .colorScheme
                //                         .onSurface)),
                //             textScaleFactor: MediaQuery.of(context).textScaleFactor
                //         ),
                //
                //         //space
                //         const SizedBox(
                //           height: 40,
                //         ),
                //
                //         //start time, end Time
                //         Row(
                //           mainAxisSize: MainAxisSize.max,
                //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                //           children: [
                //             Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 const SizedBox(
                //                   height: 4,
                //                 ),
                //                 RichText(
                //                     text: TextSpan(
                //                         text: "Start Time",
                //                         style: Theme.of(context)
                //                             .textTheme
                //                             .labelSmall
                //                             ?.copyWith(
                //                             color: Theme.of(context)
                //                                 .colorScheme
                //                                 .onSurfaceVariant)),
                //                     textScaleFactor: MediaQuery.of(context).textScaleFactor
                //                 ),
                //                 // const SizedBox(
                //                 //   height: 6,
                //                 // ),
                //                 RichText(
                //                     text: TextSpan(
                //                         text: "10:00",
                //                         style: Theme.of(context)
                //                             .textTheme
                //                             .displayMedium
                //                             ?.copyWith(
                //                             color: Theme.of(context)
                //                                 .colorScheme
                //                                 .onSurfaceVariant)),
                //                     textScaleFactor: MediaQuery.of(context).textScaleFactor
                //                 ),
                //               ],
                //             ),
                //             Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 const SizedBox(
                //                   height: 4,
                //                 ),
                //                 RichText(
                //                     text: TextSpan(
                //                         text: "End Time",
                //                         style: Theme.of(context)
                //                             .textTheme
                //                             .labelSmall
                //                             ?.copyWith(
                //                             color: Theme.of(context)
                //                                 .colorScheme
                //                                 .onSurfaceVariant)),
                //                     textScaleFactor: MediaQuery.of(context).textScaleFactor
                //                 ),
                //                 // const SizedBox(
                //                 //   height: 6,
                //                 // ),
                //                 RichText(
                //                     text: TextSpan(
                //                         text: "22:00",
                //                         style: Theme.of(context)
                //                             .textTheme
                //                             .displayMedium
                //                             ?.copyWith(
                //                             color: Theme.of(context)
                //                                 .colorScheme
                //                                 .onSurfaceVariant)),
                //                     textScaleFactor: MediaQuery.of(context).textScaleFactor
                //                 ),
                //               ],
                //             )
                //           ],
                //         ),
                //
                //         //space
                //         const SizedBox(
                //           height: 24,
                //         ),
                //
                //         //Report and Clock in
                //         Row(
                //           mainAxisSize: MainAxisSize.max,
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           crossAxisAlignment: CrossAxisAlignment.end,
                //           children: [
                //             ElevatedButton(
                //               onPressed: () {
                //                 // Get.offNamed((AppRoutes.HOME));
                //               },
                //               style: Theme.of(context)
                //                   .elevatedButtonTheme
                //                   .style
                //                   ?.copyWith(
                //                 padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                //                   const EdgeInsets.only(left: 16,right: 16,top: 12.0,bottom: 12.0),
                //                 ),
                //                 minimumSize:
                //                 ButtonStyleButton.allOrNull<Size>(
                //                   const Size(
                //                     0,
                //                     0,
                //                   ),
                //                 ),
                //                 backgroundColor: MaterialStateProperty.all(
                //                     Theme.of(context)
                //                         .colorScheme
                //                         .surfaceVariant),
                //                 shape: MaterialStateProperty.all<
                //                     RoundedRectangleBorder>(
                //                   RoundedRectangleBorder(
                //                       borderRadius:
                //                       BorderRadius.circular(borderRadius),
                //                       side: BorderSide(
                //                           color: Theme.of(context)
                //                               .colorScheme
                //                               .outline,
                //                           width: 1,
                //                           style: BorderStyle.solid)
                //                     //side: BorderSide(color: borderColor!),
                //                   ),
                //                 ),
                //               ),
                //               child: Text('Report Absence',
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .labelLarge
                //                       ?.copyWith(
                //                       color: Theme.of(context)
                //                           .colorScheme
                //                           .primary)),
                //             ),
                //             //space
                //             const SizedBox(
                //               width: 12.0,
                //             ),
                //
                //             ElevatedButton(
                //               onPressed: () {
                //                // showAlertDialog(context);
                //               },
                //               style: Theme.of(context)
                //                   .elevatedButtonTheme
                //                   .style
                //                   ?.copyWith(
                //
                //                 padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                //                   const EdgeInsets.only(left: 16,right: 16,top: 12.0,bottom: 12.0),
                //                 ),
                //                 minimumSize:
                //                 ButtonStyleButton.allOrNull<Size>(
                //                   const Size(
                //                     0,
                //                     0,
                //                   ),
                //                 ),
                //                 backgroundColor: MaterialStateProperty.all(
                //                     Theme.of(context).colorScheme.primary),
                //                 shape: MaterialStateProperty.all<
                //                     RoundedRectangleBorder>(
                //                   RoundedRectangleBorder(
                //                     borderRadius:
                //                     BorderRadius.circular(borderRadius),
                //                     //side: BorderSide(color: borderColor!),
                //                   ),
                //                 ),
                //               ),
                //               child: Text(
                //                 'Clock In',
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .labelLarge
                //                     ?.copyWith(
                //                     color: Theme.of(context)
                //                         .colorScheme
                //                         .onPrimary),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),


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
