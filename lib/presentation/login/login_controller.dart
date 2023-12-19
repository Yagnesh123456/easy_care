import 'package:get/get.dart';
import 'package:go_easy_care/data/model/login.dart';
import 'package:go_easy_care/data/model/user.dart';
import 'package:go_easy_care/data/storage_helper.dart';

import '../../data/model/media.dart';
import '../../data/remote/apis/api_response.dart';
import '../../data/remote/apis/app_exception.dart';
import '../../domain/get_media_list_usecase.dart';
import '../../domain/login_usecase.dart';

class LoginController extends GetxController {
  final _apiResponse = ApiResponse.initial('Empty data').obs;
  final _loginUsecase = LoginUseCase();


  ApiResponse get response {
    return _apiResponse.value;
  }

  Future<void> login(String email, String password) async {

    _apiResponse.value = ApiResponse.loading('Fetching artist data');
    try {
      Login response = await _loginUsecase.perform(email, password);
      _apiResponse.value = ApiResponse.completed(response);
    } on AppException catch (e) {
      _apiResponse.value = ApiResponse.error(e.getErrorMessage(), e.getTypeOfException());
    }
  }
}
