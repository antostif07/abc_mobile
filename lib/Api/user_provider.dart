import 'dart:convert';
import 'package:get/get.dart';

import '../Model/token_model.dart';
import '../Model/user_model.dart';

class UserProvider extends GetConnect {
  Future<Response<UserModel>> registerUser(body) =>
      post<UserModel>(
        'http://localhost/mergroup_app_api/public/users', body,
        decoder: (obj) => UserModel.fromJson(obj)
      );

  Future<Response<TokenModel>> login(body) =>
      post<TokenModel>(
        'http://localhost/mergroup_app_api/public/login', body,
          decoder: (obj) => TokenModel.fromJson(obj)
      );

  Future<Response<UserModel>> getCurrentUser(String? token) =>
      get<UserModel>(
          'http://localhost/mergroup_app_api/public/me',
          headers: {
            'Authorization': "Bearer $token"
          },
          decoder: (obj) {
            return UserModel.fromJson(json.decode(obj));
          }
      );
}