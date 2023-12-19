import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/presentation/dashboard/dashboard_page.dart';
import 'package:go_easy_care/presentation/login/login_page.dart';
import 'package:go_easy_care/presentation/profile/profile_page.dart';
import 'package:go_easy_care/presentation/schedule/schedule_page.dart';
import 'package:go_easy_care/presentation/theme/color.dart';
import 'package:go_easy_care/presentation/theme/text_style.dart';
import 'package:go_easy_care/presentation/timer/timer_page.dart';
import 'package:go_easy_care/presentation/translations/language_constant.dart';
import 'package:go_easy_care/presentation/widget/profile_image.dart';
import 'package:go_easy_care/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  //MediaListController controller = Get.find();

  //bottom
  var currentIndex = 0.obs;

  //side menu
  // var _selectedDestination = 0.obs;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      DashboardPage(),
      SchedulePage(),
      //Text("Page 3"),
      TimerPage(),
      //ProfilePage(),
    ];

    void changeTab(int index) {
      currentIndex.value = index;
    }

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              toggleDrawer();
            },
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                'asset/images/ic_menu_dark.svg',
                allowDrawingOutsideViewBox: false,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          centerTitle: true,
          title: Obx(() {
            return RichText(
                text: TextSpan(
                    text: currentIndex.value == 0
                        ?  LANG_CONST.DASHBOARD.toString().tr
                        : currentIndex.value == 1
                            ?  LANG_CONST.SCHEDULE.toString().tr
                            : currentIndex.value == 2
                                ?  LANG_CONST.TIME_CLOCK_QUICK.toString().tr
                                : '',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
                textScaleFactor: MediaQuery.of(context).textScaleFactor);
          }),
          actions: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Image.asset(
                'asset/images/' + 'ic_badge.png',
              ),
            ),
          ],
        ),
        drawer: Obx(() {
          return Drawer(

              //backgroundColor: Colors.green,
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                const SizedBox(
                  height: 32,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      ProfileImage(
                        size: 40,
                        fontSize: 24,
                        url: 'T',
                        imageWithBackground: true,
                        backGroundColor: Theme.of(context).colorScheme.primary,
                        borderColor: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      RichText(
                          text: TextSpan(
                              text: LANG_CONST.JOHN_SMITH.toString().tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant)),
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor),
                    ],
                  ),
                ),

                SizedBox(
                  height: 16,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: RichText(
                      text: TextSpan(
                          text:  LANG_CONST.COMMUNITY_LIVING_GOEASYCARE.toString().tr,
                          style: drawerTitleStyle.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant)),
                      textScaleFactor: MediaQuery.of(context).textScaleFactor),
                ),

                SizedBox(
                  height: 16,
                ),

                //dashboard
                Container(
                  margin: EdgeInsets.only(
                      left: 4.0, right: 4.0, top: 2.0, bottom: 2.0),
                  decoration: BoxDecoration(
                      color: currentIndex == 0
                          ? Theme.of(context).colorScheme.surfaceVariant
                          : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      'asset/images/ic_dashboard_light.svg',
                      allowDrawingOutsideViewBox: false,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    selectedColor: Theme.of(context).colorScheme.surface,
                    title: Transform.translate(
                      offset: Offset(-16, 0),
                      child: RichText(
                          text: TextSpan(
                            text:  LANG_CONST.DASHBOARD.toString().tr,
                            style:
                                Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        color: currentIndex == 0
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer
                                            : Theme.of(context)
                                                .colorScheme
                                                .onSurfaceVariant,
                                        fontWeight: currentIndex == 0
                                            ? FontWeight.w500
                                            : FontWeight.w700),
                          ),
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor),
                    ),
                    selected: currentIndex == 0,
                    onTap: () {
                      toggleDrawer();
                      // Navigator.pop(context);
                      changeTab(0);
                    },
                  ),
                ),

                //schedule
                Container(
                  margin: EdgeInsets.only(
                      left: 4.0, right: 4.0, top: 2.0, bottom: 2.0),
                  decoration: BoxDecoration(
                      color: currentIndex == 1
                          ? Theme.of(context).colorScheme.surfaceVariant
                          : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: ListTile(
                      leading: SvgPicture.asset(
                        'asset/images/ic_schedule.svg',
                        allowDrawingOutsideViewBox: false,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      selectedColor: Theme.of(context).colorScheme.surface,
                      title: Transform.translate(
                        offset: Offset(-16, 0),
                        child: RichText(
                            text: TextSpan(
                              text: LANG_CONST.SCHEDULE.toString().tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      color: currentIndex == 1
                                          ? Theme.of(context)
                                              .colorScheme
                                              .onSecondaryContainer
                                          : Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant,
                                      fontWeight: currentIndex == 1
                                          ? FontWeight.w500
                                          : FontWeight.w700),
                            ),
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor),
                      ),
                      selected: currentIndex == 1,
                      onTap: () {
                        toggleDrawer();
                        //  Navigator.pop(context);
                        changeTab(1);
                      }),
                ),

                //profile
                Container(
                  margin: EdgeInsets.only(
                      left: 4.0, right: 4.0, top: 2.0, bottom: 2.0),
                  decoration: BoxDecoration(
                      color: currentIndex == 2
                          ? Theme.of(context).colorScheme.surfaceVariant
                          : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: ListTile(
                      leading: SvgPicture.asset(
                        'asset/images/ic_profile.svg',
                        allowDrawingOutsideViewBox: false,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      selectedColor:
                          Theme.of(context).colorScheme.surfaceVariant,
                      title: Transform.translate(
                        offset: Offset(-16, 0),
                        child: RichText(
                            text: TextSpan(
                              text:  LANG_CONST.PROFILE.toString().tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      color: currentIndex == 2
                                          ? Theme.of(context)
                                              .colorScheme
                                              .onSecondaryContainer
                                          : Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant,
                                      fontWeight: currentIndex == 2
                                          ? FontWeight.w500
                                          : FontWeight.w700),
                            ),
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor),
                      ),
                      selected: currentIndex == 2,
                      onTap: () {
                        toggleDrawer();
                        //   Navigator.pop(context);
                        // changeTab(2);
                        Get.to(ProfilePage());
                      }),
                ),

                //Logout
                Container(
                  margin: EdgeInsets.only(
                      left: 4.0, right: 4.0, top: 2.0, bottom: 2.0),
                  decoration: BoxDecoration(
                      color: currentIndex == 3
                          ? Theme.of(context).colorScheme.surfaceVariant
                          : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: ListTile(
                      leading: SvgPicture.asset(
                        'asset/images/ic_logout.svg',
                        allowDrawingOutsideViewBox: false,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      selectedColor:
                          Theme.of(context).colorScheme.surfaceVariant,
                      title: Transform.translate(
                        offset: Offset(-16, 0),
                        child: RichText(
                            text: TextSpan(
                              text: 'logout'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      color: currentIndex == 3
                                          ? Theme.of(context)
                                              .colorScheme
                                              .onSecondaryContainer
                                          : Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant,
                                      fontWeight: currentIndex == 3
                                          ? FontWeight.w500
                                          : FontWeight.w700),
                            ),
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor),
                      ),
                      selected: currentIndex == 3,
                      onTap: () {
                        toggleDrawer();
                        // Navigator.pop(context);
                        //  Navigator.pop(context);

                        //Get.offAll(LoginPage());
                        Get.offAllNamed(AppRoutes.LOGIN);
                        // changeTab(2);
                      }),
                ),
              ],
            ),
          ));
        }),
        body: Obx(() {
          return Center(
            child: pages[currentIndex.value],
          );
        }),
        bottomNavigationBar: Obx(() {
          return NavigationBar(
            selectedIndex: currentIndex.value,
            backgroundColor: Colors.transparent,
            onDestinationSelected: (index) => changeTab(index),
            destinations: [
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  'asset/images/ic_dashboard_light.svg',
                  allowDrawingOutsideViewBox: false,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                icon: SvgPicture.asset(
                  'asset/images/ic_dashboard.svg',
                  allowDrawingOutsideViewBox: false,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                label: "",
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  'asset/images/ic_schedule.svg',
                  allowDrawingOutsideViewBox: false,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                icon: SvgPicture.asset(
                  'asset/images/ic_schedule.svg',
                  allowDrawingOutsideViewBox: false,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                label: "",
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  'asset/images/ic_timer.svg',
                  allowDrawingOutsideViewBox: false,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                icon: SvgPicture.asset(
                  'asset/images/ic_timer.svg',
                  allowDrawingOutsideViewBox: false,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                label: "",
              ),
            ],
          );
        }));
  }

  //  void selectDestination(int index) {
  //    //setState(() {
  //      _selectedDestination.value = index;
  // //   });
  //  }

//drawer open close
  toggleDrawer() async {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
