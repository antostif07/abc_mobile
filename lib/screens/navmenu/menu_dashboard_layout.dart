import 'package:abc_mobile/controllers/home_controller.dart';
import 'package:abc_mobile/screens/Courses/courses.dart';
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

  final screensList = [
    const Home(),
    Courses(),
  ];

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
          const Menu(),
          Obx(() => Dashboard(
            screenWidth: screenWidth,
            child: screensList[controller.mainScreen.value],
          )),
        ],
      ),
    );
  }
}
