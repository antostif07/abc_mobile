import 'package:abc_mobile/controllers/HomeController.dart';
import 'package:get/get.dart';

import '../../../theme/config.dart' as config;
import 'package:flutter/material.dart';

import '../Home/home.dart';
import 'dashboard.dart';
import 'menu.dart';

const Color backgroundColor = Colors.lightBlue;

class MenuDashboardLayout extends GetView<HomeController>{
  MenuDashboardLayout({super.key});
  double? screenHeight, screenWidth;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: config.Colors().waves,
            ),
          ),
          Menu(
              onMenuTap: controller.onMenuTap,
              slideAnimation: controller.slideAnimation,
              menuAnimation: controller.menuScaleAnimation,
              onMenuItemClicked: controller.onMenuItemClicked),
          Dashboard(
            duration: controller.duration,
            onMenuTap: controller.onMenuTap,
            scaleAnimation: controller.scaleAnimation,
            isCollapsed: controller.isCollapsed.value,
            screenWidth: screenWidth,
            child: const Home(),
          ),
        ],
      ),
    );
  }
}
