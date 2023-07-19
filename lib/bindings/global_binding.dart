import 'package:abc_mobile/Api/user_provider.dart';
import 'package:abc_mobile/controllers/home_controller.dart';
import 'package:abc_mobile/controllers/authentication_controller.dart';
import 'package:abc_mobile/controllers/on_boarding_controller.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  final userProvider = UserProvider();

  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationController(userProvider: userProvider));
    Get.put(OnBoardingController());
    Get.lazyPut(() => HomeController());
  }
}