import 'package:abc_mobile/controllers/authentication_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/global_binding.dart';
import '../routes.dart';

class GlobalMiddleware extends GetMiddleware {
  final authenticationManager = Get.find<AuthenticationController>();

  @override
  RouteSettings? redirect(String? route) {
    if (kDebugMode) {
      print(authenticationManager.isLogged());
    }
    return authenticationManager.isLogged() && (route == Routes.login)
        ? null : const RouteSettings(name: Routes.onBoarding);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    return authenticationManager.getToken() != null
        ? page?.copy(parameters: {'token': authenticationManager.getToken().toString()}) : page;
  }

  @override
  List<Bindings> onBindingsStart(List<Bindings>? bindings) {
    bindings = [GlobalBinding()];
    return bindings;
  }
}