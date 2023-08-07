import 'dart:convert';

import 'package:abc_mobile/Model/course_model.dart';
import 'package:abc_mobile/utils/cache_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Api/api_provider.dart';
import '../Model/center_model.dart';

class CourseController extends GetxController with CacheManager, GetSingleTickerProviderStateMixin {
  CourseController({required this.apiProvider});

  final ApiProvider apiProvider;

  final isLoading = false.obs;
  final centers = [].obs;
  final courses = [].obs;
  final selectedTab = 0.obs;
  final selectedCourses = [].obs;
  late final TabController tabController;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getCenters();
    await getCourses();
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
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
          tabController = TabController(initialIndex: 0, length: centers.value.length, vsync: this);
          selectedTab.value = 0;
        }
      });
    } finally {
      isLoading(false);
    }
  }

  Future<void> getCourses() async {
    try {
      isLoading(true);
      await apiProvider.getData('/courses', decoder: (obj) => CourseModel.courseFromJson(json.decode(obj)['hydra:member'])).then((response) {
        if (response.hasError) {
          if (kDebugMode) {
            print(response.statusText);
          }
        } else {
          courses.value = response.body;
          selectedCourses.value = courses.value.where((element) => (element as CourseModel).center.id == centers.value[selectedTab.value].id).toList();
        }
      });
    } finally {
      isLoading(false);
    }
  }

  void setSelectedTab(int val) {
    selectedTab.value = val;
    selectedCourses.value = courses.value.where((element) => (element as CourseModel).center.id == centers.value[val].id).toList();
  }
}