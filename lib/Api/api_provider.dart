import 'dart:convert';

import 'package:abc_mobile/utils/cache_manager.dart';
import 'package:get/get.dart';

import '../Model/token_model.dart';
import '../Model/user_model.dart';
import '../routes.dart';

class ApiProvider extends GetConnect with CacheManager {
  Future<Response> getData(String endpoint,
      {Map<String, dynamic>? query, String? contentType, Map<String, dynamic>? headers,
        Function(dynamic)? decoder}
      ) async {
    try {
      Response response = await get(
        '${Routes.apiUrl}$endpoint',
        contentType: contentType, query: query,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $getToken()'
        },
        decoder: decoder,
      );
      // response = handleResponse(response);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String endpoint,
      Map<String, dynamic> body, {String? contentType, Map<String, dynamic>? headers,
        Function(dynamic)? decoder}
      ) async {
    try {
      Response response = await post(
        '${Routes.apiUrl}$endpoint', body,
        contentType: contentType,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $getToken()'
        },
        decoder: decoder,
      );
      // response = handleResponse(response);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response<TokenModel>> login(body) =>
      post<TokenModel>(
          '${Routes.apiUrl}/login', body,
          decoder: (obj) => TokenModel.fromJson(obj)
      );

  Future<Response<UserModel>> getCurrentUser(String? token) =>
      get<UserModel>(
          '${Routes.apiUrl}/me',
          headers: {
            'Authorization': "Bearer $token"
          },
          decoder: (obj) {
            return UserModel.fromJson(json.decode(obj));
          }
      );
}