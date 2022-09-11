// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:almaodonto/src/config/themes/app_assets.dart';
import 'package:almaodonto/src/config/themes/app_colors.dart';
import 'package:almaodonto/src/features/auth/presentation/widgets/input_form.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../widgets/botao_grande.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>(debugLabel: 'loginFormKey');

  void logar() {
    if (loginFormKey.currentState!.validate()) {
      controller.carregandoLogin = true;
      controller.checkCpf();
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
            SizedBox(
              height: 100,
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
                        'CPF',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                    ]),
                    InputForm(
                      onChanged: (value) {
                        controller.cpf = value;
                      },
                      color: AppColors.azul,
                      controller: controller.cpfController,
                      hintText: '000.000.000-00',
                      hintColor: Colors.grey,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Você deve informar um CPF válido.";
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    // ignore: prefer_const_literals_to_create_immutables
                    Row(children: [
                      Text(
                        'Data de Nascimento',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 10),
                    ]),
                    InputForm(
                      color: AppColors.azul,
                      controller: controller.dataNascimentoController,
                      hintText: '00/00/0000',
                      hintColor: Colors.grey,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly, DataInputFormatter()],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Você deve informar uma data válida.";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 150),
                    Center(
                      child: Obx(() {
                        return BotaoGrande(
                          text: 'ENTRAR',
                          onTap: logar,
                          loading: controller.carregandoLogin,
                        );
                      }),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Image.asset(AppAssets.ans3),
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
