import '../../theme/box_icons_icons.dart';
import '../../theme/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;

import '../screens/video.dart';
import 'card.dart';

class FormationCard extends material.StatelessWidget {
  final bool long;
  const FormationCard({
    required this.long,
    material.Key? key,
  }) : super(key: key);

  @override
  material.Widget build(material.BuildContext context) {
    return material.Padding(
      padding: const material.EdgeInsets.all(10.0),
      child: CardWidget(
        gradient: false,
        button: true,
        width: long ? 360 : 180,
        child: material.Column(
          mainAxisAlignment: material.MainAxisAlignment.start,
          children: <material.Widget>[
            Expanded(child: material.Container(
              width: long ? 360 : 180,
              height: 87,
              decoration: material.BoxDecoration(
                image: material.DecorationImage(
                    image: material.AssetImage('assets/images/logo.png'),
                    fit: material.BoxFit.cover),
                borderRadius: material.BorderRadius.only(
                  topLeft: material.Radius.circular(10),
                  topRight: material.Radius.circular(10),
                ),
              ),
              child: material.Text(""),
            )),
            material.Padding(
              padding: const material.EdgeInsets.only(top: 6.0),
              child: material.GestureDetector(
                child: material.Container(
                  padding: material.EdgeInsets.fromLTRB(0, 14, 0, 14),
                  decoration: material.BoxDecoration(gradient: Colors().waves),
                  child: const material.Row(
                    mainAxisAlignment: material.MainAxisAlignment.spaceEvenly,
                    children: <material.Widget>[
                      material.Icon(BoxIcons.bxs_coupon,
                          color: material.Colors.white),
                      material.Text(
                        "Centre de formation",
                        style: material.TextStyle(
                            color: material.Colors.white,
                            fontFamily: 'Red Hat Display',
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => VideoPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
