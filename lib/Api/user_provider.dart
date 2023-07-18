import 'dart:convert';
import 'package:get/get.dart';

import '../Model/token_model.dart';
import '../Model/user_model.dart';

class UserProvider extends GetConnect {
  final String apiUrl = 'http://localhost:8000';

  // if(kDebugMode) {
  //   apiUrl = 'http://localhost:8000';
  // } else {
  //   apiUrl = 'https://aht-sarl.com/abc_api/public';
  // }

  Future<Response<UserModel>> registerUser(body) =>
      post<UserModel>(
        '$apiUrl/users', body,
        decoder: (obj) => UserModel.fromJson(obj)
      );

  Future<Response<TokenModel>> login(body) =>
      post<TokenModel>(
        '$apiUrl/login', body,
          decoder: (obj) => TokenModel.fromJson(obj)
      );

  Future<Response<UserModel>> getCurrentUser(String? token) =>
      get<UserModel>(
          '$apiUrl/me',
          headers: {
            'Authorization': "Bearer $token"
          },
          decoder: (obj) {
            return UserModel.fromJson(json.decode(obj));
          }
      );
}