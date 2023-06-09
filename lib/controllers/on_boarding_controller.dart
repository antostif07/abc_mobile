import 'package:abc_mobile/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class OnBoardingController extends GetxController {
  final int numPages = 3;
  final PageController pageController = PageController(initialPage: 0);
  final currentPage = 0.obs;


  @override
  void onInit() {
    super.onInit();
    createWidgets();
  }

  List<Widget> widgets = [];

  void createWidgets() {
    widgets.addAll([
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,child: Image.asset('assets/images/1.png'),
          ),
          Expanded(
              child: Text("Apprenez depuis votre téléphone et à votre rythme",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xFFFFFFFF)
                ),
              )
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,child: Image.asset('assets/images/2.png'),
          ),
          Expanded(
            child: Text(
              "Accéder facilement à tous les cours.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0xFFFFFFFF)
              ),
            ),
          )
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png', width: 210,),
                  const Text(
                    "Réjoignez-nous maintenant!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFFFFFFF)),
                  ),
                ],
              )
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, bottom: 10),
            child: CupertinoButton(
                color: const Color(0xFFFFFFFF),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Se connecter ➡",
                      style: TextStyle(
                          fontFamily: 'Red Hat Display',
                          fontSize: 16,
                          color: Color(0xFF0083BE),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onPressed: () {
                  Get.offNamed(Routes.login);
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: TextButton(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "S'Enregistrer",
                      style: TextStyle(
                          fontFamily: 'Red Hat Display',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onPressed: () {
                  // Get.offNamed(Routes.dashboard);
                }),
          )
        ],
      ),
    ]);
  }

  void changePage(int page) {
    currentPage.value = page;
  }
}