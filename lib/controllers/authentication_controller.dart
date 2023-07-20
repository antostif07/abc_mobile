import 'dart:convert';

import 'package:abc_mobile/Model/error_model.dart';
import 'package:abc_mobile/utils/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Api/api_provider.dart';
import '../routes.dart';

class AuthenticationController extends GetxController with CacheManager {
  AuthenticationController({required this.apiProvider});

  final ApiProvider apiProvider;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final phoneInputText = ''.obs;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final errorMessage = "".obs;
  final isLoading = false.obs;
  final obscureText = true.obs;

  Future<void> login(body) async {
    try {
      isLoading(true);
      await apiProvider.login(body).then((response) {
        if (response.statusCode == 200) {
          try {
            apiProvider.getCurrentUser(response.body?.token).then((value) {
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
      await apiProvider.postData('/users', body).then((response) {
        if(response.hasError) {
          final errorModel = ErrorModel(message: json.decode(response.body)["violations"][0]["message"]);
          Get.showSnackbar(
              GetSnackBar(
                backgroundColor: Colors.red,
                title: 'Error',
                message: errorModel.message,
                duration: const Duration(seconds: 5),
              )
          );
        } else {
          resetForm();
          Get.showSnackbar(
              const GetSnackBar(
                backgroundColor: Colors.blueAccent,
                title: 'Succès',
                message: 'Compte crée avec succès',
                duration: Duration(seconds: 5),
              )
          );
          Get.toNamed(Routes.login);
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

  bool checkRegisterValidations() {
    if(nameController.text.isEmpty){
      Get.showSnackbar(
          const GetSnackBar(
            backgroundColor: Colors.red,
            title: 'Erreur',
            message: 'Nom obligatoire',
            duration: Duration(seconds: 3),
          )
      );
      return false;
    }
    if(nameController.text.length < 3){
      Get.showSnackbar(
          const GetSnackBar(
            backgroundColor: Colors.red,
            title: 'Erreur',
            message: 'Nom trop court',
            duration: Duration(seconds: 3),
          )
      );
      return false;
    }
    if(passwordController.text.isEmpty){
      Get.showSnackbar(
          const GetSnackBar(
            backgroundColor: Colors.red,
            title: 'Erreur',
            message: 'Mot de passe obligatoire',
            duration: Duration(seconds: 3),
          )
      );
      return false;
    }
    if(passwordController.text.length < 8){
      Get.showSnackbar(
          const GetSnackBar(
            backgroundColor: Colors.red,
            title: 'Erreur',
            message: 'Mot de passe trop court',
            duration: Duration(seconds: 3),
          )
      );
      return false;
    }
    if(passwordController.text != confirmPasswordController.text) {
      Get.showSnackbar(
          const GetSnackBar(
            backgroundColor: Colors.red,
            title: 'Erreur',
            message: 'Mot de passe incorrect',
            duration: Duration(seconds: 3),
          )
      );
      return false;
    }
    return true;
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }
}