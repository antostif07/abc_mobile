import 'package:abc_mobile/controllers/authentication_controller.dart';
import 'package:abc_mobile/routes.dart';
import 'package:abc_mobile/widgets/blue_wave_background.dart';
import 'package:abc_mobile/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../widgets/textfield.dart';

class RegisterScreen extends GetView<AuthenticationController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const BlueWaveBackground(),
            Positioned(
              left: -30, right: -30,
              top: 0, bottom: 400,
              child: Image.asset(
                'assets/images/banner.jpeg',
                scale: 1.5,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 600,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "S'enregistrer",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: HexColor("#4f4f4f"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Votre nom",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: HexColor("#8d8d8d"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AbcTextField(
                              controller: controller.nameController,
                              hintText: "Nom et Prenom",
                              obscureText: false,
                              prefixIcon: const Icon(Icons.people),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Numéro de téléphone",
                              style: GoogleFonts.poppins(
                                color: HexColor("#8d8d8d"),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) {
                                  controller.phoneInputText.value = number.phoneNumber!;
                                  },
                                inputDecoration: InputDecoration(
                                  fillColor: HexColor("#f0f3f1"),
                                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: HexColor("#8d8d8d"),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                ),
                                countries: const ['CD'],
                                selectorConfig: const SelectorConfig(
                                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                  showFlags: true,
                                ),
                                textFieldController: controller.telController,
                                keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true)
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                controller.errorMessage.value,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Mot de passe",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: HexColor("#8d8d8d"),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Obx(() => AbcTextField(
                              controller: controller.passwordController,
                              hintText: "**************",
                              obscureText: controller.obscureText.value,
                              prefixIcon: controller.obscureText.value ? const Icon(Icons.lock_outline) : const Icon(Icons.lock_open_outlined),
                              onPressed: () {
                                controller.toggleObscureText();
                              },
                            )),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Confirmer Mot de passe",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: HexColor("#8d8d8d"),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Obx(() => AbcTextField(
                              controller: controller.confirmPasswordController,
                              hintText: "**************",
                              obscureText: controller.obscureText.value,
                              prefixIcon: controller.obscureText.value ? const Icon(Icons.lock_outline) : const Icon(Icons.lock_open_outlined),
                              onPressed: () {
                                controller.toggleObscureText();
                              },
                            )),
                            const SizedBox(
                              height: 20,
                            ),
                            Obx(() => ButtonWidget(
                              onPressed: (){
                                if(controller.checkRegisterValidations()){
                                  controller.register({
                                    "phone": controller.phoneInputText.value,
                                    "password": controller.passwordController.text,
                                    "name": controller.nameController.text,
                                  });
                                }
                              },
                              buttonText: controller.isLoading.value ? 'loading' : "S'enregistrer" ,
                            ),),
                            const SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Déjà enregistré?",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          color: HexColor("#8d8d8d"),
                                        )),
                                    TextButton(
                                        child: Text(
                                          "Se connecter",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: HexColor("#44564a"),
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.toNamed(Routes.login);
                                        }
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}