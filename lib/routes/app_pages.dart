import 'package:get/get.dart';
import 'package:go_easy_care/presentation/forgot_password/forgot_password_binding.dart';
import 'package:go_easy_care/presentation/forgot_password/forgot_password_page.dart';
import 'package:go_easy_care/presentation/login/login_binding.dart';
import 'package:go_easy_care/presentation/login/login_page.dart';
import 'package:go_easy_care/presentation/schedule/schedule.dart';
import 'package:go_easy_care/presentation/splash/splash_binding.dart';
import 'package:go_easy_care/presentation/splash/splash_screen.dart';

import '../presentation/calendar_test/cal_test.dart';
import '../presentation/calendar_test/calendar_page.dart';
import '../presentation/dashboard/dashboard_binding.dart';
import '../presentation/dashboard/dashboard_page.dart';
import '../presentation/home/home_page.dart';
import '../presentation/media_list/media_list_binding.dart';
import '../presentation/profile/profile_page.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage (
      name: AppRoutes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding()
    ),

    GetPage (
        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding()
    ),

    GetPage (
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: DashboardBinding()
    ),

    GetPage (
      name: AppRoutes.SHEDULE_INFO,
      page: () => ScheduleInformation(),
      binding: MediaListBinding()
    ),

    GetPage (
        name: AppRoutes.PROFILE,
        page: () => ProfilePage(),
        binding: MediaListBinding()
    ),

    GetPage (
        name: AppRoutes.FORGOT_PASSWORD,
        page: () => ForgotPasswordPage(),
        binding: ForgotPasswordBinding()
    ),
  ];
}