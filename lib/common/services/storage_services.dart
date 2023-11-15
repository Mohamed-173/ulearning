import 'package:shared_preferences/shared_preferences.dart';
import 'package:uleaningapp/common/constant/constants.dart';

class StorageServices {
  late final SharedPreferences _pref;

  Future<StorageServices> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConst.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getDeviceLogedIn() {
    return _pref.getString(AppConst.Storage_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  Future<bool> setFirstFalse() {
    return _pref.setBool(AppConst.STORAGE_DEVICE_OPEN_FIRST_TIME, false);
  }
}
