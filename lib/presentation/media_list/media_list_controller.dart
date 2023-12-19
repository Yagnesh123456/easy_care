import 'package:get/get.dart';

import '../../data/model/media.dart';
import '../../data/remote/apis/api_response.dart';
import '../../data/remote/apis/app_exception.dart';
import '../../domain/get_media_list_usecase.dart';

class MediaListController extends GetxController {
  final _apiResponse = ApiResponse.initial('Empty data').obs;
  final _getMediaListUsecase = GetMediaListUseCase();

  ApiResponse get response {
    return _apiResponse.value;
  }

  Future<void> getMediaList(String url) async {
    /*_apiResponse.value = ApiResponse.loading('Fetching artist data');
    try {
      List<Media> mediaList = await _getMediaListUsecase.perform(url);
      _apiResponse.value = ApiResponse.completed(mediaList);
    } on AppException catch (e) {
      _apiResponse.value = ApiResponse.error(e.getErrorMessage(), e.getTypeOfException());
    }*/
  }
}
