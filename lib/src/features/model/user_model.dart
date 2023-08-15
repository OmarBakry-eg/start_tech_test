// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    final bool? success;
    final String? message;
    final Data? data;

    UserModel({
        this.success,
        this.message,
        this.data,
    });

    UserModel copyWith({
        bool? success,
        String? message,
        Data? data,
    }) => 
        UserModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    final String? id;
    final String? name;
    final String? countryCode;
    final String? phone;
    final String? email;
    final String? token;
    final DateTime? tokenExpiry;

    Data({
        this.id,
        this.name,
        this.countryCode,
        this.phone,
        this.email,
        this.token,
        this.tokenExpiry,
    });

    Data copyWith({
        String? id,
        String? name,
        String? countryCode,
        String? phone,
        String? email,
        String? token,
        DateTime? tokenExpiry,
    }) => 
        Data(
            id: id ?? this.id,
            name: name ?? this.name,
            countryCode: countryCode ?? this.countryCode,
            phone: phone ?? this.phone,
            email: email ?? this.email,
            token: token ?? this.token,
            tokenExpiry: tokenExpiry ?? this.tokenExpiry,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        countryCode: json["country_code"],
        phone: json["phone"],
        email: json["email"],
        token: json["token"],
        tokenExpiry: json["token_expiry"] == null ? null : DateTime.parse(json["token_expiry"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_code": countryCode,
        "phone": phone,
        "email": email,
        "token": token,
        "token_expiry": tokenExpiry?.toIso8601String(),
    };
}
