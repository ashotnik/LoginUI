import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences preferences;

  const PreferencesService(this.preferences);

  Future<void> setphoneNumber(String phoneNumber) async {
    await preferences.setString('phoneNumber', phoneNumber);
  }

  String? getphoneNumber() => preferences.getString('phoneNumber');

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
