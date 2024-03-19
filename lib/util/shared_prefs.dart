import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  late SharedPreferences _prefs;

  // Singleton pattern to ensure a single instance of SharedPreferences
  static MySharedPreferences? _instance;

  factory MySharedPreferences() {
    _instance ??= MySharedPreferences._();
    return _instance!;
  }

  MySharedPreferences._() {
    init(); // Initialize _prefs in the constructor
    _instance = this; // Initialize _instance in the constructor
  }

  // Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // String key setter and getter

  // OAuthKey getter and setter
  void deleteData() {
    _prefs.clear();
  }

  Future<void> saveData(String key, dynamic data) async {
    if (data is int) {
      _prefs.setInt(key, data);
    } else if (data is double) {
      _prefs.setDouble(key, data);
    } else if (data is bool) {
      _prefs.setBool(key, data);
    } else if (data is String) {
      _prefs.setString(key, data);
    } else {
      throw Exception("Unsupported data type");
    }
  }

  dynamic getData(String key) {
    return _prefs.get(key);
  }
}
