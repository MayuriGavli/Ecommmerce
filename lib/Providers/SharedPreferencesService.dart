// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPreferencesService {
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//
//   // Function to load the stored value from SharedPreferences
//   static Future<String?> loadStoredValue(String key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs
//         .getString(key); // If the key doesn't exist, set a default value
//   }
//
//   // Function to save the value to SharedPreferences
//    Future<void> saveValue(String key, value) async {
//     // SharedPreferences prefs = await SharedPreferences.getInstance();
//     final SharedPreferences prefs = await _prefs;
//     print("vatanasojasodijsaijoijd");
//     print(key);
//     print(value);
//      prefs.setString(key, value);
//   }
// }
