import 'package:abc_mobile/utils/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Api/user_provider.dart';
import '../routes.dart';

class AuthenticationController extends GetxController with CacheManager {
  AuthenticationController({required this.userProvider});

  final UserProvider userProvider;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final phoneInputText = ''.obs;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
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
                resetForm();
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

  Future<void> register(body) async {
    try {
      isLoading(true);

      // validations test

      await userProvider.registerUser(body).then((response) {
        if (response.statusCode == 201 || response.statusCode == 200) {
          resetForm();
          isLoading(false);
          // Get.showSnackbar(
          //   GetSnackBar(
          //     title: 'Enregistrement',
          //     message: '${response.body?.name} enregistré avec succès.',
          //     duration: const Duration(seconds: 3),
          //   )
          // );
          Get.offAllNamed(Routes.login);
        } else {
          isLoading(false);
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

  void resetForm() {
    nameController.text = '';
    telController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
  }
}