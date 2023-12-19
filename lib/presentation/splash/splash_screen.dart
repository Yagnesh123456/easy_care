import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/presentation/login/login_page.dart';
import 'package:go_easy_care/presentation/splash/splash_controller.dart';
import 'package:go_easy_care/routes/app_routes.dart';


class SplashScreen extends StatefulWidget  {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<SplashScreen>  with SingleTickerProviderStateMixin  {


  late Animation<double> animation;
  late AnimationController controller;
  SplashController splashController = Get.find();

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0, end: 600).animate(controller)  ..addListener(() {
         //  setState(() {
             // The state that has changed here is the animation object’s value.
         //  });
         });
       controller.forward();

    Timer(Duration(seconds: 3),
            ()=> {

              if(splashController.isLogin()) {
                Get.offAllNamed(AppRoutes.HOME)
              } else {
                Get.offAllNamed(AppRoutes.LOGIN)
              }
            }
    );
  }
  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Container(
            color: Colors.transparent,
            //color: Colors.white,
            // height: animation.value,
            // width: animation.value,
            child:
            //FlutterLogo(size:MediaQuery.of(context).size.height)
            Image.asset(
              //"asset/images/ic_splash_logo_light.png",
              isDarkMode ? "asset/images/ic_splash_logo_dark.png" :  "asset/images/ic_splash_logo_light.png",
            )


            // child: AnimatedSplash(
            //   imagePath: 'assets/gfg.png',
            //   home: Home(),
            //   customFunction: duringSplash,
            //   duration: 2500,
            //   type: AnimatedSplashType.BackgroundProcess,
            //   outputAndHome: op,
            // ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
