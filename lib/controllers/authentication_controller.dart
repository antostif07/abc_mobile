import 'package:abc_mobile/utils/cache_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Api/user_provider.dart';
import '../routes.dart';

class AuthenticationController extends GetxController with CacheManager {
  AuthenticationController({required this.userProvider});

  final UserProvider userProvider;
  final TextEditingController telController = TextEditingController();
  final phoneInputText = ''.obs;
  final TextEditingController passwordController = TextEditingController();
  final errorMessage = "".obs;
  final isLoading = false.obs;

  Future<void> login(body) async {
    try {
      isLoading(true);
      await userProvider.login(body).then((response) {
        if (response.statusCode == 200) {
          try {
            userProvider.getCurrentUser(response.body?.token).then((value) {
              if (value.statusCode == 200) {
                print('success');
                saveToken(response.body?.token);
                saveConnectedUser(value.body);
                setIsLogged(true);
                Get.offAllNamed(Routes.dashboard);
              }
            });
          } finally {

          }

        } else {
          return null;
        }
      });
    } finally {
      isLoading(false);
    }
  }

  Future<void> checkLoginStatus() async {
    final token = getToken();
    if (token != null) {
      await setIsLogged(true);
    } else {
      await setIsLogged(false);
    }
  }
}