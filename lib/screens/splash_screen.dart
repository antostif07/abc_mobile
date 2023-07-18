import 'package:abc_mobile/controllers/authentication_controller.dart';
import 'package:abc_mobile/screens/navmenu/menu_dashboard_layout.dart';
import 'package:abc_mobile/widgets/blue_wave_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'OnBoard/on_boarding.dart';

class SplashScreen extends GetView<AuthenticationController> {
  const SplashScreen({super.key});

  Future<void> initializeSettings() async {
    // controller.checkLoginStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if(snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return controller.isLogged() ? MenuDashboardLayout() : const OnBoarding();
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(
        body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
      body: Stack(children: [
        const BlueWaveBackground(),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset('assets/images/logo.png',),
          )
        )
      ]),
    );
  }
}