import 'package:abc_mobile/Model/center_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/box_icons_icons.dart';
import '../../theme/config.dart' as config;
import 'package:flutter/material.dart';

import '../screens/Courses/course_screen.dart';
import 'card.dart';

class FormationCard extends StatelessWidget {
  final bool long;
  final CenterModel center;

  const FormationCard({
    required this.long,
    required this.center,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CardWidget(
        gradient: false,
        button: true,
        width: long ? 360 : 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(child: Container(
              width: long ? 360 : 180,
              height: 87,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: const Text(""),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: GestureDetector(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
                  decoration: BoxDecoration(gradient: config.Colors().waves),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Icon(BoxIcons.bxs_coupon, color: Colors.white),
                      Text(
                        center.name,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  return;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
