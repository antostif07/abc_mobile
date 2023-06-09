import 'package:abc_mobile/controllers/authentication_controller.dart';
import 'package:abc_mobile/controllers/on_boarding_controller.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardingController());
    Get.lazyPut(() => AuthenticationController());
  }
}