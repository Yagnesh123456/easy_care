import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_easy_care/presentation/theme/app_themedata.dart';
import 'package:go_easy_care/presentation/translations/app_translations.dart';
import 'package:go_easy_care/routes/app_pages.dart';
import 'package:go_easy_care/routes/app_routes.dart';

import 'data/fake/fake_go_easy_care_service.dart';
import 'data/fake/fake_go_easy_care_service_impl.dart';
import 'data/remote/go_easy_care_service.dart';
import 'data/remote/go_easy_care_service_impl.dart';
import 'data/repository/go_easy_care_repository.dart';
import 'data/repository/go_easy_care_repository_impl.dart';
import 'data/storage_helper.dart';

void main() async{
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GoEasyCare',
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.list,
      initialBinding: BindingsBuilder(
            () => {

          Get.lazyPut<GoEasyCareService>(() => GoEasyCareServiceImpl(), fenix: true),
          Get.lazyPut<GoEasyCareRepository>(() => GoEasyCareRepositoryImpl(), fenix: true),
          Get.lazyPut<StorageHelper>(() => StorageHelper.instance, fenix: true),
        },
      ),

      debugShowCheckedModeBanner: false,

      theme: appMaterialLightThemeData,
      // in user set themes, one hoook a controller
      themeMode: ThemeMode.system,
      darkTheme: appMaterialDarkThemeData,
      //locale: Locale('hi', 'IN'),
      locale: Locale('en', 'US'),
      translationsKeys: AppTranslation.translations,
      fallbackLocale: Locale('en', 'US'),
      //fallbackLocale: Locale('hi', 'IN'),

    );
  }
}