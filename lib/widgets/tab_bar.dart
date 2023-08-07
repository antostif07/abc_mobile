import 'package:flutter/material.dart';

class ItemTab {
  ItemTab(this.name, this.icon);

  final String name;
  final IconData icon;
}

class AppTabBar extends StatelessWidget {
  const AppTabBar({super.key, this.items, this.tabController, this.onTap,});

  final List<ItemTab>? items;
  final TabController? tabController;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: tabController,
        isScrollable: true,
        labelColor: Colors.blue,
        labelPadding: EdgeInsets.zero,
        onTap: onTap,
        padding: const EdgeInsets.only(bottom: 16, top: 16),
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.greenAccent,
                offset: Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
            ]
        ),
        indicatorColor: Colors.transparent,
        indicatorWeight: 8,
        tabs: items!.map((item) => Tab(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(item.icon),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(item.name)
                ],
              ),
            ))
        ).toList());
  }

}