import 'package:get/get.dart';
import 'package:go_easy_care/data/model/user.dart';

import '../data/model/banner_messages.dart';
import '../data/model/media.dart';
import '../data/repository/go_easy_care_repository.dart';

class GetDashboardMessages{

  GoEasyCareRepository repository = Get.find();

  @override
  Future<List<BannerMessages>> perform() {
    return repository.getBannerMessages();
  }
}