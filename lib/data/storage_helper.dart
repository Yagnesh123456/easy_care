
import 'package:get_storage/get_storage.dart';

class StorageHelper {
  GetStorage storage = GetStorage();

  StorageHelper._privateConstructor();

  static final StorageHelper _instance = StorageHelper._privateConstructor();

  static StorageHelper get instance => _instance;


  void setValue(String key, String value) async{
    await storage.write(key, value);
  }

  String getValue(String key) {
    if(storage.read(key) != null) {
      return storage.read(key);
    } else {
      return "";
    }
  }
}