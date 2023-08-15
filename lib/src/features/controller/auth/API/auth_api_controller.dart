import 'package:dio/dio.dart';
import 'package:start_tech_test/src/core/dio/dio_client.dart';
import 'package:start_tech_test/src/core/log/logger.dart';
import 'package:start_tech_test/src/features/local_storage/local_storage.dart';
import 'package:start_tech_test/src/features/model/user_model.dart';

import 'auth_body.dart';

class AuthAPIController with AuthBody {
  UserModel _userModel = UserModel();
  final DioClient _dioClient = DioClient();
  final LocalStorage _localStorage = LocalStorage();

  Future<UserModel?> signUpFunc(
      {required String email,
      required String password,
      required String countryCode,
      required String name,
      required String phone}) async {
    try {
      Response? res = await _dioClient.post('api/user/register', '',
          body: signUpMap(
              name: name,
              email: email,
              password: password,
              countryCode: countryCode,
              phone: phone)) as Response?;
      _userModel = UserModel.fromJson(res?.data);
      await _localStorage.setNewToken(_userModel.data!.token!);
      await _localStorage.setNewUserID(_userModel.data!.id!);
      logSuccess('userModel token : ${_userModel.data?.token}');
      return _userModel;
    } catch (e) {
      logError('error in signUpFunc ${e.toString()}');
    }
    return null;
  }

  Future<UserModel?> loginFunc({
    required String email,
    required String password,
  }) async {
    try {
      Response res = await _dioClient.post('api/login', '',
          body: signInMap(
            email: email,
            password: password,
          )) as Response;
      _userModel = UserModel.fromJson(res.data);
      await _localStorage.setNewToken(_userModel.data!.token!);
      await _localStorage.setNewUserID(_userModel.data!.id!);

      logSuccess('userModel token : ${_userModel.data?.token}');
      return _userModel;
    } catch (e) {
      logError('error in loginFunc ${e.toString()}');
    }
    return null;
  }
}
