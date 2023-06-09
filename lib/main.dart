import 'package:abc_mobile/bindings/global_binding.dart';
import 'package:abc_mobile/routes.dart';
import 'package:abc_mobile/screens/Auth/login.dart';
import 'package:abc_mobile/screens/navmenu/menu_dashboard_layout.dart';
import 'package:abc_mobile/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      getPages: [
        GetPage(name: Routes.login, page: () => const LoginScreen()),
        GetPage(name: Routes.dashboard, page: () => MenuDashboardLayout())
      ],
    );
  }
}
