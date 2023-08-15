mixin AuthBody {
  Map<String, dynamic> signUpMap({
    required String email,
    required String password,
    required String countryCode,
    required String phone,
    required String name,
  }) =>
      {
        'name' : name,
        'email': email,
        'phone': phone,
        'password': password,
        'password_confirm': password,
        'country_code': countryCode
      };

  Map<String, dynamic> signInMap({
    required String email,
    required String password,
  }) =>
      {
        'email': email,
        'password': password,
      };
}
