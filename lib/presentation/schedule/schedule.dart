import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/data/fake/datamodel.dart';
import 'package:go_easy_care/presentation/translations/language_constant.dart';
import 'package:go_easy_care/presentation/widget/text_button.dart';
import '../translations/language_constant.dart';
import '../widget/color_dot.dart';
import '../widget/profile_image.dart';

class ScheduleInformation extends StatelessWidget {
  ScheduleInformation({Key? key}) : super(key: key);

  double borderRadius = 50.0;
  List<Menu> data = [];

  @override
  Widget build(BuildContext context) {
    dataList.forEach((element) {
      data.add(Menu.fromJson(element));
    });

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 20.0, top: 20.0, bottom: 20.0),
              child: SvgPicture.asset(
                'asset/images/ic_close_light.svg',
                allowDrawingOutsideViewBox: false,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          centerTitle: true,
          title: RichText(
            text: TextSpan(
              text:  LANG_CONST.SCHEDULE_INFORMATION.toString().tr,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
              textScaleFactor: MediaQuery.of(context).textScaleFactor
          ),
        ),
        body: Column(
          children: [
            // RichText(text: TextSpan(
            //   text: "Viewing Future Shift",
            //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            //     color:Theme.of(context).colorScheme.onPrimaryContainer,
            //   ),
            // ),
            // ),

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
                                  text: 'end_time'.tr,
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
                            showAlertDialog(context);
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
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {},
        ));
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    // Widget yesButton = TextButton(
    //   // child: Text("Yes"),
    //   child: RichText(
    //     text: TextSpan(
    //         text: "Yes",
    //         style: Theme.of(context)
    //             .textTheme
    //             .labelLarge
    //             ?.copyWith(color: Theme.of(context).colorScheme.primary)),
    //       textScaleFactor: MediaQuery.of(context).textScaleFactor
    //   ),
    //   onPressed: () {
    //     Get.back();
    //   },
    // );

    // Widget noButton = TextButton(
    //   //child: Text("No"),
    //   child: RichText(
    //     text: TextSpan(
    //         text: "No",
    //         style: Theme.of(context)
    //             .textTheme
    //             .labelLarge
    //             ?.copyWith(color: Theme.of(context).colorScheme.primary)),
    //       textScaleFactor: MediaQuery.of(context).textScaleFactor
    //   ),
    //   onPressed: () {
    //     Get.back();
    //   },
    // );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      //title: Text("Caution"),
      title: RichText(
        text: TextSpan(
            text:  LANG_CONST.CAUTION.toString().tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
          textScaleFactor: MediaQuery.of(context).textScaleFactor
      ),
      content: RichText(
        text: TextSpan(
            text:
            LANG_CONST.YOU_ARE_ATTEMPTING_TO_CLOCK_IN.toString().tr,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant)),
          textScaleFactor: MediaQuery.of(context).textScaleFactor
      ),

      // content: Text("You are attempting to Clock In 1 hour before the scheduled start time.\n\nAre you sure you wish to perform this action?"),
    //  actions: [yesButton, noButton],
      actions: [TextButtonView(text:  LANG_CONST.YES.toString().tr,onPress:(){ Get.back();} ),
        TextButtonView(text:  LANG_CONST.NO.toString().tr,onPress:(){ Get.back();} ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget _buildList(Menu list) {
    if (list.subMenu!.isEmpty) {
      return Builder(builder: (context) {
        return ListTile(
            // onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategory(list.name))),
            leading: SizedBox(),
            title: Text(list.name!));
      });
    }
    return ExpansionTile(
      leading: Icon(list.icon),
      title: Text(
        list.name!,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: list.subMenu!.map(_buildList).toList(),
    );
  }
}
