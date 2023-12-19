import 'package:get/get.dart';

import '../data/model/media.dart';
import '../data/repository/go_easy_care_repository.dart';

class GetMediaListUseCase{

  GoEasyCareRepository repository = Get.find();

  /*Future<List<Media>> perform(String url) {
    return repository.getMediaList(url);
  }*/
}