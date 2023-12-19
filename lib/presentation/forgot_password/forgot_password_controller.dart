import 'package:get/get.dart';
import 'package:go_easy_care/data/model/user.dart';

import '../../data/model/media.dart';
import '../../data/remote/apis/api_response.dart';
import '../../data/remote/apis/app_exception.dart';
import '../../domain/get_media_list_usecase.dart';
import '../../domain/login_usecase.dart';

class ForgotPasswordController extends GetxController {
  //final _apiResponse = ApiResponse.initial('Empty data').obs;
  //final _loginUsecase = LoginUseCase();

  /*ApiResponse get response {
    return _apiResponse.value;
  }*/

 /* Future<void> login(String emailAddress, String password) async {
    _apiResponse.value = ApiResponse.loading('Fetching artist data');
    try {
      User user = await _loginUsecase.perform(emailAddress, password);
      _apiResponse.value = ApiResponse.completed(user);
    } on AppException catch (e) {
      _apiResponse.value = ApiResponse.error(e.getErrorMessage(), e.getTypeOfException());
    }
  }*/
}
