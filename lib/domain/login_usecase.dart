import 'package:get/get.dart';
import 'package:go_easy_care/data/model/login.dart';
import 'package:go_easy_care/data/model/user.dart';

import '../data/model/media.dart';
import '../data/repository/go_easy_care_repository.dart';
import '../data/storage_helper.dart';

class LoginUseCase{

  GoEasyCareRepository repository = Get.find();
  final StorageHelper _storageHelper = Get.find();

  Future<Login> perform(String email, String password) async{

    final response = await repository.login(email, password);
    _storageHelper.setValue("token", response.token);
    print("token: ${_storageHelper.getValue("token")}");
    return response;
  }
}