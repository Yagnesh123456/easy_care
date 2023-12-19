import 'package:get/get.dart';
import 'package:go_easy_care/data/model/banner_messages.dart';

import '../model/login.dart';
import '../remote/go_easy_care_service.dart';
import 'go_easy_care_repository.dart';

class GoEasyCareRepositoryImpl  extends GoEasyCareRepository{

  GoEasyCareService api = Get.find();

  @override
  Future<Login> login(String emailAddress, String password) {
    return api.login(emailAddress, password);
  }

  @override
  Future<List<BannerMessages>> getBannerMessages() {
    return api.getBannerMessages();
  }
}
