import 'package:get/get.dart';
import 'package:go_easy_care/data/model/user.dart';
import 'package:go_easy_care/utils/Logger.dart';

import '../../data/model/banner_messages.dart';
import '../../data/model/media.dart';
import '../../data/remote/apis/api_response.dart';
import '../../data/remote/apis/app_exception.dart';
import '../../domain/get_dashboard_messages.dart';
import '../../domain/get_media_list_usecase.dart';
import '../../domain/login_usecase.dart';
import 'package:location/location.dart';

class DashboardController extends GetxController {
  final _apiResponse = ApiResponse.initial('Empty data').obs;
  final _getDashboardMessages = GetDashboardMessages();

  //location
  var  _serviceEnabled = false.obs;
  var  lat = 00.0.obs;
  var  long = 00.0.obs;

  ApiResponse get response {
    return _apiResponse.value;
  }

  DashboardController() {
    //getLocation();
    //getDashboardMessages();
  }


  Future<void> getDashboardMessages() async {
    print("call getDashboardMessages");
    _apiResponse.value = ApiResponse.loading('Fetching dashboard data');
    try {
      List<BannerMessages> list = await _getDashboardMessages.perform();
      _apiResponse.value = ApiResponse.completed(list);
      print("response get ");
    } on AppException catch (e) {
      _apiResponse.value = ApiResponse.error(e.getErrorMessage(), e.getTypeOfException());
      print("error : ${e.getErrorMessage()}");
    }
  }

  Future<void> getLocation() async {
    Location location =  Location();

    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled.value = await location.serviceEnabled();
    if (!_serviceEnabled.value) {
      _serviceEnabled.value = await location.requestService();
      if (!_serviceEnabled.value) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    Logger.get().log('_locationData.latitude ${_locationData.latitude}');
    Logger.get().log('_locationData.longitude ${_locationData.longitude}');

      lat.value = _locationData.latitude!;
      long.value = _locationData.longitude!;

    Logger.get().log('lat.value => ${lat.value}');
    Logger.get().log('long.value => ${long.value}');

  }


}
