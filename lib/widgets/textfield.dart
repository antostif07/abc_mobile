import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AbcTextField extends material.StatelessWidget {
  final material.TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final material.Icon prefixIcon;
  final Function()? onChanged;

  const AbcTextField(
      {super.key,
        required this.controller,
        required this.hintText,
        required this.obscureText,
        required this.prefixIcon,
        this.onChanged});

  @override
  Widget build(BuildContext context) {
    return material.TextField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: HexColor("#4f4f4f"),
      decoration: material.InputDecoration(
        hintText: hintText,
        fillColor: HexColor("#f0f3f1"),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        hintStyle: GoogleFonts.poppins(
          fontSize: 15,
          color: HexColor("#8d8d8d"),
        ),
        border: material.OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: HexColor("#4f4f4f"),
        filled: true,
      ),
    );
  }
  
}