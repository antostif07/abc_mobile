import 'package:abc_mobile/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/global_binding.dart';
import '../routes.dart';

class UnauthenticatedMiddleware extends GetMiddleware {
  final authenticationManager = Get.find<AuthenticationController>();

  @override
  RouteSettings? redirect(String? route) {
    print(route);
    return !authenticationManager.isLogged() && (route == Routes.login || route == Routes.onBoarding ||
      route == Routes.register
    )
        ? null : const RouteSettings(name: Routes.onBoarding);
  }

  @override
  List<Bindings> onBindingsStart(List<Bindings>? bindings) {
    bindings = [GlobalBinding()];
    return bindings;
  }
}