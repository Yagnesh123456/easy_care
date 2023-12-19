
import '../model/banner_messages.dart';
import '../model/login.dart';
import '../model/media.dart';
import '../model/user.dart';

abstract class GoEasyCareRepository{
  //Future<List<Media>> getMediaList(String url);
  Future<Login> login(String email, String password);
  Future<List<BannerMessages>> getBannerMessages();
}
