import 'package:dio/dio.dart';
import 'package:start_tech_test/src/core/dio/dio_client.dart';
import 'package:start_tech_test/src/core/log/logger.dart';
import 'package:start_tech_test/src/features/controller/home/API/home_body.dart';
import 'package:start_tech_test/src/features/local_storage/local_storage.dart';
import 'package:start_tech_test/src/features/model/user_model.dart';
import 'package:start_tech_test/src/utils/consts.dart';

class HomeAPIController with HomeBody {
  UserModel _userModel = UserModel();
  final DioClient _dioClient = DioClient();
  final LocalStorage _localStorage = LocalStorage();
  Future<UserModel?> getCurrentUser({
    required String? userID,
  }) async {
    try {
      if (userID == null) {
        Constants.dialogMessage(description: 'No ID available');
        return null;
      }
      String? token = await _localStorage.getToken;
      if (token == null) {
        Constants.dialogMessage(description: 'No token available');
        return null;
      }
      Response res = await _dioClient.get(
        'api/user/$userID',
        token,
      ) as Response;
      _userModel = UserModel.fromJson(res.data);
      logSuccess('userModel email : ${_userModel.data?.email}');
      return _userModel;
    } catch (e) {
      logError('error in getCurrentUser ${e.toString()}');
    }
    return null;
  }

  Future<bool> updateUserDataFunc(
      {required String email,
      required String countryCode,
      required String name,
      required String phone}) async {
    try {
      String? token = await _localStorage.getToken;
      if (token == null) {
        Constants.dialogMessage(description: 'No token available');
        return false;
      }
      await _dioClient.post('api/user/update', token,
          body: updateUserData(
              email: email,
              name: name,
              countryCode: countryCode,
              phone: phone)) as Response;
      return true;
    } catch (e) {
      logError('error in updateUserDataFunc ${e.toString()}');
    }
    return false;
  }

  Future<bool> changePasswordFunc(
      {required String oldPassword, required String newPassword}) async {
    try {
      String? token = await _localStorage.getToken;
      if (token == null) {
        Constants.dialogMessage(description: 'No token available');
        return false;
      }
      await _dioClient.post('api/user/update', token,
          body: changePasswordBody(
              oldPassword: oldPassword, newPassword: newPassword)) as Response;
      return true;
    } catch (e) {
      logError('error in changePasswordFunc ${e.toString()}');
    }
    return false;
  }

Future<bool> deletUserFunc() async {
    try {
      String? token = await _localStorage.getToken;
      if (token == null) {
        Constants.dialogMessage(description: 'No token available');
        return false;
      }
      await _dioClient.delete('api/user/delete', token,) as Response;
      return true;
    } catch (e) {
      logError('error in changePasswordFunc ${e.toString()}');
    }
    return false;
  }



}
