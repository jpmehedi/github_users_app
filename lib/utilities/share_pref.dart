import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  static Future<void> saveData(bool data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('saveData', data);
  }

  static Future<bool> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('saveData') ?? false;
  }

  
  static Future<void> removeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("saveData");
  }

}