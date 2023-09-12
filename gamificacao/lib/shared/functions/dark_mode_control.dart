// import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getDarkMode() async {
  var sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getBool('darkModeEnabled') ?? false;
}

Future setDarkMode(bool status) async {
  var sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.setBool('darkModeEnabled', status);
}
