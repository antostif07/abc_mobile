import 'package:abc_mobile/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends GetView<HomeController> {
  final double? screenWidth;
  final Widget? child;

  const Dashboard(
      {Key? key,
      this.screenWidth,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
      duration: controller.duration,
      top: 0,
      bottom: 0,
      left: controller.isCollapsed.value ? 0 : 0.6 * screenWidth!,
      right: controller.isCollapsed.value ? 0 : -0.6 * screenWidth!,
      child: ScaleTransition(
        scale: controller.scaleAnimation!,
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                offset: Offset(0, 10),
                color: Color(0x2A636363),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: controller.isCollapsed.value
                ? BorderRadius.zero
                : const BorderRadius.all(Radius.circular(20)),
            child: Material(
              animationDuration: controller.duration,
              child: child,
            ),
          ),
        ),
      ),
    ));
  }
}
