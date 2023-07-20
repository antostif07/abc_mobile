import 'package:abc_mobile/Api/api_provider.dart';
import 'package:abc_mobile/controllers/home_controller.dart';
import 'package:abc_mobile/controllers/authentication_controller.dart';
import 'package:abc_mobile/controllers/on_boarding_controller.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  final apiProvider = ApiProvider();

  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationController(apiProvider: apiProvider));
    Get.put(OnBoardingController());
    Get.lazyPut(() => HomeController());
  }
}