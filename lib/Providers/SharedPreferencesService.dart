import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // Function to load the stored value from SharedPreferences
  static Future<Object?> loadStoredValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs
        .getString(key); // If the key doesn't exist, set a default value
  }

  // Function to save the value to SharedPreferences
  static Future<void> saveValue(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }
}
