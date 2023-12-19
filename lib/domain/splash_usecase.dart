import 'package:get/get.dart';
import 'package:go_easy_care/data/model/login.dart';
import 'package:go_easy_care/data/model/user.dart';

import '../data/model/media.dart';
import '../data/repository/go_easy_care_repository.dart';
import '../data/storage_helper.dart';

class SplashUseCase{

  final StorageHelper _storageHelper = Get.find();

  //Check user is login or not
  bool perform() {

    if(_storageHelper.getValue("token").isNotEmpty) {
      return true;
    }
    return false;
  }
}