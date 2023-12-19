

import 'package:go_easy_care/data/model/login.dart';
import 'package:go_easy_care/data/model/user.dart';

import '../model/banner_messages.dart';
import '../model/media.dart';
import 'base_service.dart';

abstract class GoEasyCareService extends BaseService{
  Future<Login> login(String email, String password);
  //Future<List<Media>> getMediaList(String url);
  Future<List<BannerMessages>> getBannerMessages();
}
