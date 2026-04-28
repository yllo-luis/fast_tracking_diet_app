import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesServiceContract {
  Future<void> getSharedPreferencesInstance();

  // Set data with shared preferences.
  Future<void> setBoolData({required String key, required bool data});
  Future<void> setIntData({required String key, required int data});
  Future<void> setDoubleData({required String key, required double data});
  Future<void> setStringData({required String key, required String data});

  // Retrieve data with shared preferences.
  bool? getBoolData({required String key});
  int? getIntData({required String key});
  double? getDoubleData({required String key});
  String? getStringData({required String key});
}

class SharedPreferencesService
    implements SharedPreferencesServiceContract {
  SharedPreferencesService();

  SharedPreferences? sharedPreferences;

  @override
  Future<void> getSharedPreferencesInstance() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
  }

  @override
  bool? getBoolData({required String key}) {
    if (sharedPreferences == null) {
      throw Exception(
        'Shared Preferences is not initialized check what is happening with this class instance',
      );
    }

    return sharedPreferences?.getBool(key);
  }

  @override
  double? getDoubleData({required String key}) {
    if (sharedPreferences == null) {
      throw Exception(
        'Shared Preferences is not initialized check what is happening with this class instance',
      );
    }

    return sharedPreferences?.getDouble(key);
  }

  @override
  int? getIntData({required String key}) {
    if (sharedPreferences == null) {
      throw Exception(
        'Shared Preferences is not initialized check what is happening with this class instance',
      );
    }

    return sharedPreferences?.getInt(key);
  }

  @override
  String? getStringData({required String key}) {
    if (sharedPreferences == null) {
      throw Exception(
        'Shared Preferences is not initialized check what is happening with this class instance',
      );
    }

    return sharedPreferences?.getString(key);
  }

  @override
  Future<void> setBoolData({required String key, required bool data}) async {
    if (sharedPreferences == null) {
      throw Exception(
        'Shared Preferences is not initialized check what is happening with this class instance',
      );
    }

    await sharedPreferences?.setBool(key, data);
  }

  @override
  Future<void> setDoubleData({
    required String key,
    required double data,
  }) async {
    if (sharedPreferences == null) {
      throw Exception(
        'Shared Preferences is not initialized check what is happening with this class instance',
      );
    }

    await sharedPreferences?.setDouble(key, data);
  }

  @override
  Future<void> setIntData({required String key, required int data}) async {
    if (sharedPreferences == null) {
      throw Exception(
        'Shared Preferences is not initialized check what is happening with this class instance',
      );
    }

    await sharedPreferences?.setInt(key, data);
  }

  @override
  Future<void> setStringData({
    required String key,
    required String data,
  }) async {
    if (sharedPreferences == null) {
      throw Exception(
        'Shared Preferences is not initialized check what is happening with this class instance',
      );
    }

    await sharedPreferences?.setString(key, data);
  }
}
