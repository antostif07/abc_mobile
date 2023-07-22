import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppMenuItem extends StatelessWidget {
  const AppMenuItem({super.key, required this.icon, required this.title, this.selected, this.onClicked});

  final IconData icon;
  final String title;
  final bool? selected;
  final Function()? onClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: selected != null && selected! ? FontWeight.bold : FontWeight.normal,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

}