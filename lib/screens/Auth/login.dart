import 'package:abc_mobile/controllers/authentication_controller.dart';
import 'package:abc_mobile/widgets/blue_wave_background.dart';
import 'package:abc_mobile/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../widgets/textfield.dart';

class LoginScreen extends GetView<AuthenticationController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const BlueWaveBackground(),
            Positioned(
              left: 0, top: -15,
              child: Image.asset(
                'assets/Images/plants.png',
                scale: 1.5,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 500,
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
                        "Se connecter",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: HexColor("#4f4f4f"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                print(number.phoneNumber);
                              },
                              onInputValidated: (bool value) {
                                print(value);
                              },
                              selectorConfig: const SelectorConfig(
                                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                showFlags: true,
                              ),
                              textFieldController: controller.telController,
                              formatInput: true,
                                keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true)
                            ),
                            // AbcTextField(
                            //   onChanged: (() {
                            //     controller.validateEmail(controller.emailController.text);
                            //   }),
                            //   controller: controller.emailController,
                            //   hintText: "hello@gmail.com",
                            //   obscureText: false,
                            //   prefixIcon: const Icon(Icons.mail_outline),
                            // ),
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
                              height: 10,
                            ),
                            Text(
                              "Mot de passe",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: HexColor("#8d8d8d"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AbcTextField(
                              controller: controller.passwordController,
                              hintText: "**************",
                              obscureText: true,
                              prefixIcon: const Icon(Icons.lock_outline),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ButtonWidget(
                              onPressed: (){
                                Get.offAllNamed('/dashboard');
                              },
                              buttonText: 'Se connecter',
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Vous n'avez pas de compte?",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: HexColor("#8d8d8d"),
                                      )),
                                  TextButton(
                                      child: Text(
                                        "S'inscrire",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: HexColor("#44564a"),
                                        ),
                                      ),
                                      onPressed: () {
                                        // go to register page
                                      }
                                  ),
                                ],
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