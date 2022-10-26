// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
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
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>(debugLabel: 'loginFormKey');

  void logar() {
    if (loginFormKey.currentState!.validate()) {
      controller.carregandoLogin = true;
      controller.login();
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
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Image.asset(
                    AppAssets.headerPerfil,
                    height: 100,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          Text(
                            'Olá',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Obx(() {
                                    return AutoSizeText(
                                      controller.appController.clienteAtivo.data!.name,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Bem-Vindo(a)',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Form(
              key: loginFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // ignore: prefer_const_literals_to_create_immutables
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Senha',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),

                    SizedBox(height: 10),
                    InputForm(
                      color: AppColors.azul,
                      controller: controller.senhaController,
                      obscureText: true,
                      hintText: 'Use a mesma senha do banco central',
                      hintColor: Colors.grey,
                      onChanged: (value) {
                        controller.senha = value;
                      },
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
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        TextButton(
                          child: Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: Image.asset(AppAssets.ans3),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: BotaoGrande(
                        text: 'ENTRAR',
                        onTap: logar,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Não tem uma conta?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Cadastrar',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 14,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('cadastrar-se');
                                  },
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
