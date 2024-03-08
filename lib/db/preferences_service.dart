import 'package:shared_preferences/shared_preferences.dart';

// SOLID
// KISS
// YAGNI
// Singleton
// Service Locator vs Dependency Injection

class PreferencesService {
  final SharedPreferences preferences;

  const PreferencesService(this.preferences);

  // Second Variant to get instance
  // Future<SharedPreferences> initPreferences() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs;
  // }

  Future<void> setphoneNumber(String phoneNumber) async {
    await preferences.setString('phoneNumber', phoneNumber);
  }

  String? getphoneNumber() => preferences.getString('username');

  Future<void> setUsername(String username) async {
    await preferences.setString('username', username);
  }

  String? getUsername() => preferences.getString('username');

  Future<void> setEmail(String email) async {
    await preferences.setString('email', email);
  }

  String? getEmail() => preferences.getString('email');

  Future<void> setPassword(String password) async {
    await preferences.setString('password', password);
  }

  String? getPassword() => preferences.getString('password');
}
