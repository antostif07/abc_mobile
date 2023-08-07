import 'package:abc_mobile/controllers/course_controller.dart';
import 'package:abc_mobile/controllers/home_controller.dart';
import 'package:abc_mobile/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/config.dart' as config;
import '../../widgets/topBar.dart';

class Courses extends GetView<HomeController> {
  Courses({
    Key? key,
  }) : super(key: key);

  final courseController = Get.find<CourseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: config.Colors().secondColor(1),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                TopBar(),
                // Obx(() => AppTabBar(
                //   items: courseController.centers.value.map(
                //           (e) => ItemTab(e.name, Icons.school)
                //   ).toList(),
                //   onTap: (val) {
                //     courseController.selectedTab(val);
                //   },
                // ))
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text('Tous les Cours', style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
                (context, index) {
              return Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: CourseCard(course: courseController.selectedCourses.value[index]),
                );
              });
            },
            childCount: courseController.selectedCourses.value.length,
          )),
        ],
      ),
    );
  }
}
