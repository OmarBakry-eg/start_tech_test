mixin HomeBody {
  Map<String, dynamic> updateUserData({
    String? email,
    String? name,
    String? countryCode,
    String? phone,
  }) =>
      {
        if (email != null) ...{
          'email': email,
        },
        if (phone != null) ...{
          'phone': phone,
        },
        if (countryCode != null) ...{'country_code': countryCode},
        if (name != null) ...{'name': name}
      };

  Map<String, dynamic> changePasswordBody(
          {required String oldPassword, required String newPassword}) =>
      {
        "password": oldPassword,
        "password_confirm": oldPassword,
        "current_password": newPassword,
      };
}
