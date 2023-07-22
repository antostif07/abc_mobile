import 'dart:convert';

import 'package:abc_mobile/utils/cache_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Api/api_provider.dart';
import '../Model/center_model.dart';

class HomeController extends GetxController with CacheManager, GetSingleTickerProviderStateMixin {
  HomeController({required this.apiProvider});

  ApiProvider apiProvider;
  final TextEditingController searchController = TextEditingController();
  final expanded = true.obs;
  final isCollapsed = true.obs;
  final tab = 0.obs;
  late AnimationController animationController;
  final Duration duration = const Duration(milliseconds: 200);
  Animation<double>? scaleAnimation;
  Animation<double>? menuScaleAnimation;
  Animation<Offset>? slideAnimation;

  final isLoading = false.obs;
  final centers = [].obs;

  final mainScreen = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    animationController = AnimationController(vsync: this, duration: duration);
    scaleAnimation = Tween<double>(begin: 1, end: 0.75).animate(animationController);
    menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(animationController);
    slideAnimation = Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
        .animate(animationController);

    await getCenters();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    animationController.dispose();
  }

  void onMenuTap() {
    if (isCollapsed.value) {
      animationController.forward();
    } else {
      animationController.reverse();
    }

    isCollapsed.value = !isCollapsed.value;
  }

  void onMenuItemClicked() {
    animationController.reverse();

    isCollapsed.value = !isCollapsed.value;
  }

  Future<void> getCenters() async {
    try {
      isLoading(true);
      await apiProvider.getData('/centers', decoder: (obj) => CenterModel.centerFromJson(json.decode(obj)['hydra:member'])).then((response) {
        if (response.hasError) {
          if (kDebugMode) {
            print(response.statusText);
          }
        } else {
          centers.value = response.body;
        }
      });
    } finally {
      isLoading(false);
    }
  }
}