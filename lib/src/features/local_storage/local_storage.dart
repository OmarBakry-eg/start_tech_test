import 'package:shared_preferences/shared_preferences.dart';

abstract class _LocalStorageLogic {
  //* Token
  Future<bool> setNewToken(String token);
  Future<String>? get getToken;
  Future<bool> get removeToken;

//* User ID
  Future<bool> setNewUserID(String userID);
  Future<String>? get getUserID;
  Future<bool> get removeUserID;
}

class LocalStorage implements _LocalStorageLogic {
//* Variables
  static const String _tokenID = "TOKENID";
  static const String _userID = "userID";
//* Token
  @override
  Future<bool> setNewToken(String token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    return sharedPreferences.setString(_tokenID, token);
  }

  @override
  Future<String>? get getToken async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    return Future.value(sharedPreferences.getString(_tokenID));
  }

  @override
  Future<bool> get removeToken async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return await sharedPreferences.remove(_tokenID);
  }

//* User ID
@override
  Future<bool> setNewUserID(String userID) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    return sharedPreferences.setString(_userID, userID);
  }

  @override
  Future<String>? get getUserID async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    return Future.value(sharedPreferences.getString(_userID));
  }

  @override
  Future<bool> get removeUserID async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return await sharedPreferences.remove(_userID);
  }

}
