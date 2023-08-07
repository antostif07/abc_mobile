import 'package:abc_mobile/controllers/home_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/box_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;

class TopBar extends GetView<HomeController> {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      width: MediaQuery.of(context).size.width,
      // height: controller.expanded.value
      //     ? MediaQuery.of(context).size.height * 0.35
      //     : MediaQuery.of(context).size.height * 0.19,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: GestureDetector(
                    child: const material.CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.png',),
                    ),
                    onTap: () {},
                  ),
                ),),
                Expanded(flex: 3, child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Text(
                    "Salut, ${(controller.getConnectedUser().name.split(' ')).first}.",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF343434),
                        fontSize: 18,
                        fontWeight: material.FontWeight.w600),
                  ),
                )),
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
            padding: const EdgeInsets.all(16.0),
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
        ],
      ),
    );
  }
}
