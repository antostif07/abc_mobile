import 'package:abc_mobile/controllers/on_boarding_controller.dart';
import 'package:abc_mobile/widgets/blue_wave_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/box_icons_icons.dart';

class OnBoarding extends GetView<OnBoardingController> {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            const BlueWaveBackground(),
            Positioned(
                top: 0, left: 0,
                child: Image.asset('assets/images/wave.png')
            ),
            Align(
              alignment: Alignment.center,
              child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (value) {
                    controller.currentPage.value = value;
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) => controller.widgets[index]),
            ),
            Obx(() {
              return controller.currentPage.value == 2
                  ? Container()
                  : Positioned(
                  bottom: 10,
                  right: 10,
                  child: CupertinoButton(
                    child: Icon(
                      controller.currentPage.value == 1
                          ? BoxIcons.bx_check
                          : BoxIcons.bx_chevron_right,
                      color: const Color(0xFFFFFFFF),
                      size: 30,
                    ),
                    onPressed: () {
                      controller.pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.fastOutSlowIn);
                    },
                  ));
            })
          ]
      ),
    );
  }
}