import 'package:shared_preferences/shared_preferences.dart';
import 'package:what_todo/model/User.dart';

class SharedPref {
  SharedPref._();
  SharedPreferences _preferences;
  static final SharedPref pref = SharedPref._();
  static String token;
  static String userId;
  static User user;

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

  Future<void> saveUserId(String userId) async {
    final SharedPreferences p = await _getSharedPref;

    p.setString("userId", userId);
    SharedPref.userId = await getToken();
  }

  Future<String> getUserId() async {
    final SharedPreferences p = await _getSharedPref;

    return p.getString("userId");
  }

  Future<Map<String, String>> getUserData() async {
    final SharedPreferences p = await _getSharedPref;

    final id = p.getString("userId");
    final userToken = p.getString("image");
    return {"userId": id, "token": userToken};
  }

  Future<User> fillUser() async {
    await getUserId().then((userId) async {
      if (userId != null)
        await getUserData().then((value) {
          user = User(
            id: value['userId'],
            token: value['token'],
          );
        });
    });
    return user;
  }

  Future<User> checkLogin() async {
    try {
      final SharedPreferences p = await _getSharedPref;
      final String token = p.getString("token");
      print("token " + token);
      if (token != null) {
        return await fillUser();
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
