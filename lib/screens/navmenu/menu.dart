import 'package:abc_mobile/controllers/home_controller.dart';
import 'package:abc_mobile/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/box_icons_icons.dart';

class Menu extends GetView<HomeController> {
  final int? selectedIndex;

  const Menu(
      {Key? key,
      this.selectedIndex,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.33,
            height: MediaQuery.of(context).size.height * 0.67,
            decoration: BoxDecoration(
              color: const Color(0x80FFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 135,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/navwave.png"),
                  fit: BoxFit.fitWidth),
            ),
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 28, 10, 0),
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: controller.onMenuTap,
              ),
            )),
        SlideTransition(
          position: controller.slideAnimation!,
          child: ScaleTransition(
            scale: controller.menuScaleAnimation!,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/images/user.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                controller.getConnectedUser().name,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Etudiant",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Obx(() => AppMenuItem(
                      icon: BoxIcons.bx_home_circle, title: "Accueil",
                      selected: controller.mainScreen.value == 0,
                      onClicked: () {
                        controller.mainScreen.value = 0;
                        controller.onMenuItemClicked();
                      },
                    )),
                    Obx(() => AppMenuItem(
                      icon: BoxIcons.bx_book_alt, title: "Tous les cours",
                      selected: controller.mainScreen.value == 1,
                      onClicked: () {
                        controller.mainScreen.value = 1;
                        controller.onMenuItemClicked();
                      },
                    )),
                    SizedBox(
                      height: 1,
                      width: 200,
                      child: Container(
                        color: Colors.white54,
                      ),
                    ),
                    const Spacer(flex: 1),
                    const AppMenuItem(icon: BoxIcons.bx_cog, title: "Paramètres",),
                    const AppMenuItem(icon: BoxIcons.bx_help_circle, title: "Informations",),
                    const Spacer(flex: 6),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
