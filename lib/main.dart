import 'package:abc_mobile/Api/api_provider.dart';
import 'package:abc_mobile/Middleware/unauthenticated_middleware.dart';
import 'package:abc_mobile/bindings/global_binding.dart';
import 'package:abc_mobile/controllers/authentication_controller.dart';
import 'package:abc_mobile/routes.dart';
import 'package:abc_mobile/screens/Auth/login.dart';
import 'package:abc_mobile/screens/Auth/register.dart';
import 'package:abc_mobile/screens/Courses/course_screen.dart';
import 'package:abc_mobile/screens/OnBoard/on_boarding.dart';
import 'package:abc_mobile/screens/navmenu/menu_dashboard_layout.dart';
import 'package:abc_mobile/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  final ApiProvider apiProvider = ApiProvider();
  Get.lazyPut(() => AuthenticationController(apiProvider: apiProvider));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ABC Training School',
      initialBinding: GlobalBinding(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      getPages: [
        GetPage(name: Routes.onBoarding, page: () => const OnBoarding(), middlewares: [UnauthenticatedMiddleware()]),
        GetPage(name: Routes.login, page: () => const LoginScreen(), middlewares: [UnauthenticatedMiddleware()]),
        GetPage(name: Routes.register, page: () => const RegisterScreen(), middlewares: [UnauthenticatedMiddleware()]),
        GetPage(name: Routes.dashboard, page: () => MenuDashboardLayout(),),
        GetPage(name: Routes.courseScreen, page: () => const CourseScreen())
      ],
    );
  }
}
