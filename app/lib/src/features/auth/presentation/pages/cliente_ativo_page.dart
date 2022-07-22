// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/themes/app_assets.dart';
import '../../../../config/themes/app_colors.dart';
import '../controllers/login_controller.dart';
import '../widgets/botao_grande.dart';
import '../widgets/input_form.dart';

class ClienteAtivoPage extends StatelessWidget {
  ClienteAtivoPage({Key? key}) : super(key: key);
  final LoginController controller = Get.find();
  final GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(debugLabel: 'loginFormKey');

  void logar() {
    if (loginFormKey.currentState!.validate()) {
      controller.carregandoLogin = true;
      controller.login();
      // fake loading
      Future.delayed(const Duration(seconds: 2), () {
        controller.carregandoLogin = false;
      });
    } else {
      log('00');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azul,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Image.asset(AppAssets.logoLogin),
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Image.asset(
                AppAssets.headerPerfil,
                height: 100,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Form(
                key: loginFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // ignore: prefer_const_literals_to_create_immutables
                      Row(children: [
                        Text(
                          'Senha',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(height: 20),
                      ]),
                      InputForm(
                        color: AppColors.azul,
                        controller: controller.senhaController,
                        obscureText: true,
                        hintText: 'Use a mesma senha do banco central',
                        hintColor: Colors.grey,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Informe sua senha.";
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      // ignore: prefer_const_literals_to_create_immutables
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            return Container(
                              alignment: Alignment.center,
                              width: 14,
                              height: 14,
                              color: Colors.white,
                              child: Checkbox(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  side: BorderSide(color: Colors.white),
                                  checkColor: Colors.blue,
                                  activeColor: Colors.white,
                                  value: controller.salvarUsuario,
                                  onChanged: (v) {
                                    controller.salvarUsuario = v;
                                  }),
                            );
                          }),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Lembrar-se de mim',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),

                      const SizedBox(height: 100),
                      Center(
                        child: BotaoGrande(
                          text: 'ENTRAR',
                          onTap: logar,
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
