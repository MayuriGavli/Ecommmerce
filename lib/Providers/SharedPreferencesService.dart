import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // Function to load the stored value from SharedPreferences
  Future<String> loadStoredValue(String key) async {
    final SharedPreferences prefs = await _prefs;
    var data = prefs.getString(key) ?? '';
    if (data != '') {
      return data;
    } else {
      return '';
    }
  }

  // Function to save the value to SharedPreferences
  Future<void> saveValue(String key, value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);
  }
}

final sharedPrefrenceInstance = SharedPreferencesService();
