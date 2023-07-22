import 'package:abc_mobile/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/config.dart' as config;
import '../../widgets/FormationCard.dart';
import '../../widgets/sectionHeader.dart';
import '../../widgets/topBar.dart';
import '../../widgets/videoCard.dart';

class Settings extends GetView<HomeController> {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: config.Colors().secondColor(1),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverFixedExtentList(
                    delegate: SliverChildListDelegate.fixed([Container()]),
                    itemExtent: MediaQuery.of(context).size.height * 0.38),
                SliverToBoxAdapter(
                  child: SectionHeader(
                    text: 'Formations',
                    onPressed: () {},
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 245,
                    child: Obx(() => controller.isLoading.value ? const Center(
                      child: CircularProgressIndicator(),
                    ) : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.centers.value.length,
                      itemBuilder: (context, index) {
                        return FormationCard(
                          long: false,
                          center: controller.centers.value[index],
                        );
                      },
                    ),)
                  ),
                ),
                SliverToBoxAdapter(
                  child: SectionHeader(
                    text: 'Lectures récentes',
                    onPressed: () {},
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 245,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return const VideoCard(long: false);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 0,
            child: TopBar(),
          ),
        ],
      ),
    );
  }
}
