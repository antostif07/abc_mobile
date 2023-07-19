import 'package:abc_mobile/controllers/home_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/box_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;

import 'card.dart';

class TopBar extends GetView<HomeController> {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      width: MediaQuery.of(context).size.width,
      height: controller.expanded.value
          ? MediaQuery.of(context).size.height * 0.35
          : MediaQuery.of(context).size.height * 0.19,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child: Image.asset('assets/images/logo.png',)),
                Expanded(flex: 3, child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Salut, ${(controller.getConnectedUser().name.split(' ')).first}.",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF343434),
                        fontSize: 24,
                        fontWeight: material.FontWeight.w600),
                  ),
                )),
                Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    child: const material.CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                    onTap: () {},
                  ),
                ),),
                Expanded(child: GestureDetector(
                  child: material.IconButton(
                    icon: const Icon(BoxIcons.bx_menu),
                    onPressed: controller.onMenuTap,
                  ),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CupertinoTextField(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: material.Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 25,
                      offset: Offset(0, 10),
                      color: Color(0x1A636363),
                    ),
                  ]),
              padding: const EdgeInsets.all(10),
              style: GoogleFonts.poppins(
                  color: const Color(0xFF343434),
                  fontSize: 18,
              ),
              enableInteractiveSelection: true,
              controller: controller.searchController,
              expands: false,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter
              ],
              keyboardType: TextInputType.text,
              suffix: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  BoxIcons.bx_search,
                  color: Color(0xFFADADAD),
                ),
              ),
              textInputAction: TextInputAction.search,
              textCapitalization: TextCapitalization.words,
              placeholder: "Search",
              placeholderStyle: GoogleFonts.poppins(
                  color: const Color(0xFFADADAD),
                  fontSize: 18,
              ),
            ),
          ),
          controller.expanded.value
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.165,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 10, 30),
                        child: CardWidget(
                          gradient: false,
                          button: true,
                          duration: 200,
                          border: controller.tab.value == index
                              ? Border(
                                  bottom: BorderSide(
                                      color: controller.tab.value == 0
                                          ? const Color(0xFF2828FF)
                                          : controller.tab.value == 1
                                              ? const Color(0xFFFF2E2E)
                                              : controller.tab.value == 2
                                                  ? const Color(0xFFFFD700)
                                                  : const Color(0xFF33FF33),
                                      width: 5),
                                )
                              : null,
                          child: Center(
                            child: Column(
                              mainAxisAlignment:
                                  material.MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(index == 0
                                    ? BoxIcons.bx_shape_circle
                                    : index == 1
                                        ? BoxIcons.bx_shape_polygon
                                        : index == 2
                                            ? BoxIcons.bx_shape_square
                                            : BoxIcons.bx_shape_triangle),
                                Text(index == 0
                                    ? "English"
                                    : index == 1
                                        ? "Informatique"
                                        : index == 2 ? "Français" : "Espagnol", overflow: TextOverflow.fade,)
                              ],
                            ),
                          ),
                          func: () {
                            controller.tab.value = index;
                          },
                        ),
                      );
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
