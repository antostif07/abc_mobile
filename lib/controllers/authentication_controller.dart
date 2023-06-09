import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final errorMessage = "".obs;

  // void showErrorMessage(String message) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text(message),
  //         );
  //       });
  // }

  void validateEmail(String val) {
    if (val.isEmpty) {
      errorMessage.value = "Veuillez renseigner votre adresse email";
    } else if (!EmailValidator.validate(val, true)) {
      errorMessage.value = "Adresse email invalide";
    } else {
      errorMessage.value = "";
    }
  }
}