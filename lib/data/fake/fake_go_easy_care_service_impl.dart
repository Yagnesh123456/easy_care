import 'package:get/get.dart';
import 'package:go_easy_care/data/model/banner_messages.dart';
import 'package:go_easy_care/data/model/user.dart';
import 'package:go_easy_care/presentation/translations/language_constant.dart';

import 'fake_go_easy_care_service.dart';

class FakeGoEasyCareServiceImpl extends FakeGoEasyCareService {

  @override
  Future<User> login(String emailAddress, String password) async{
    return User(userId: 1, firstName: "John", lastName: "Smith");
  }

  @override
  Future<List<BannerMessages>> getDashboardMessages() async{

    List<BannerMessages> dashboardMessages = List.empty(growable: true);
    
    dashboardMessages.add(BannerMessages(title:  LANG_CONST.BANNER_MESSAGE.toString().tr, text: '${ LANG_CONST.LOREM_IPSUM_DOLOR_SIT.toString().tr}1', type: "asset/images/ic_bookmark_dark.svg"));
    dashboardMessages.add(BannerMessages(title:  LANG_CONST.ANNOUNCEMENTS.toString().tr, text:'${ LANG_CONST.LOREM_IPSUM_DOLOR_SIT.toString().tr}2', type: "asset/images/ic_megaphonre_dark.svg"));
    dashboardMessages.add(BannerMessages(title:  LANG_CONST.BANNER_MESSAGE.toString().tr, text: '${ LANG_CONST.LOREM_IPSUM_DOLOR_SIT.toString().tr}3', type: "asset/images/ic_bookmark_dark.svg"));
    dashboardMessages.add(BannerMessages(title:  LANG_CONST.ANNOUNCEMENTS.toString().tr, text: '${ LANG_CONST.LOREM_IPSUM_DOLOR_SIT.toString().tr}4', type: "asset/images/ic_megaphonre_dark.svg"));
    dashboardMessages.add(BannerMessages(title:  LANG_CONST.BANNER_MESSAGE.toString().tr, text: '${ LANG_CONST.LOREM_IPSUM_DOLOR_SIT.toString().tr}5', type: "asset/images/ic_bookmark_dark.svg"));
    dashboardMessages.add(BannerMessages(title:  LANG_CONST.ANNOUNCEMENTS.toString().tr, text: '${ LANG_CONST.LOREM_IPSUM_DOLOR_SIT.toString().tr}6', type: "asset/images/ic_megaphonre_dark.svg"));
    dashboardMessages.add(BannerMessages(title:  LANG_CONST.BANNER_MESSAGE.toString().tr, text: '${ LANG_CONST.LOREM_IPSUM_DOLOR_SIT.toString().tr}7', type: "asset/images/ic_bookmark_dark.svg"));
    dashboardMessages.add(BannerMessages(title:  LANG_CONST.ANNOUNCEMENTS.toString().tr, text: '${ LANG_CONST.LOREM_IPSUM_DOLOR_SIT.toString().tr}8', type: "asset/images/ic_megaphonre_dark.svg"));

    return dashboardMessages;
  }
}
