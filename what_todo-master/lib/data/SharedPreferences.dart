import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref._();
  SharedPreferences _preferences;
  static final SharedPref pref = SharedPref._();
  static String token;
  Future<SharedPreferences> get _getSharedPref async {
    if (_preferences != null)
      return _preferences;
    else {
      _preferences = await SharedPreferences.getInstance();
      token = await this.getToken();
      return _preferences;
    }
  }

  clear() async {
    final SharedPreferences p = await _getSharedPref;
    p.clear();

    return;
  }

  Future<void> saveToken(String token) async {
    final SharedPreferences p = await _getSharedPref;

    p.setString("token", token);
    SharedPref.token = await getToken();
  }

  Future<String> getToken() async {
    final SharedPreferences p = await _getSharedPref;

    return p.getString("token");
  }

  Future<String> checkLogin() async {
    try {
      final SharedPreferences p = await _getSharedPref;
      final String token = p.getString("token");
      print("token " + token);
      if (token != null) {
        return await getToken();
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
