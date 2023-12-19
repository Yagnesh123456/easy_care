import 'package:get/get.dart';
import 'package:go_easy_care/data/model/login.dart';
import 'package:go_easy_care/data/model/user.dart';
import 'package:go_easy_care/data/storage_helper.dart';
import 'package:go_easy_care/domain/splash_usecase.dart';

import '../../data/model/media.dart';
import '../../data/remote/apis/api_response.dart';
import '../../data/remote/apis/app_exception.dart';
import '../../domain/get_media_list_usecase.dart';
import '../../domain/login_usecase.dart';

class SplashController extends GetxController {
  final _splashUseCase = SplashUseCase();

  bool isLogin() {
    return _splashUseCase.perform();
  }
}
