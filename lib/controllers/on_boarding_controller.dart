import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
          const Expanded(
              child: Text("Apprenez depuis votre téléphone et à votre rythme",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFFFFFF)
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
          const Expanded(
            child: Text(
              "Accéder facilement à tous les cours.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFFFFFFF)
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
              child: Image.asset('assets/images/logo.png', width: 210,)
          ),
          const Expanded(child: Text(
            "Réjoignez-nous maintenant!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                color: Color(0xFFFFFFFF)),
          )),
          Expanded(child: CupertinoButton(
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
                // Get.offNamed(Routes.dashboard);
              }))
        ],
      ),
    ]);
  }

  void changePage(int page) {
    currentPage.value = page;
  }
}