import 'package:abc_mobile/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../theme/config.dart';
import '../../widgets/FormationCard.dart';
import '../../widgets/sectionHeader.dart';
import '../../widgets/topBar.dart';
import '../../widgets/videoCard.dart';

class Home extends GetView<HomeController> {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors().secondColor(1),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverFixedExtentList(
                    delegate: SliverChildListDelegate.fixed([Container()]),
                    itemExtent: MediaQuery.of(context).size.height * 0.32),
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
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return const FormationCard(long: false);
                      },
                    ),
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
                        return VideoCard(long: false);
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
          )
        ],
      ),
    );
  }
}
