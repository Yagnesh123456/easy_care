

import 'package:go_easy_care/data/model/banner_messages.dart';
import 'package:go_easy_care/data/model/user.dart';

import '../model/media.dart';
import '../remote/base_service.dart';

abstract class FakeGoEasyCareService extends BaseService{
  Future<User> login(String emailAddress, String password);
  Future<List<BannerMessages>> getDashboardMessages();
}
