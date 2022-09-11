import 'dart:developer';

import 'package:almaodonto/src/config/themes/app_assets.dart';
import 'package:almaodonto/src/config/themes/app_colors.dart';
import 'package:almaodonto/src/core/extensions/constants.dart';
import 'package:almaodonto/src/features/auth/presentation/widgets/botao_grande.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ClienteInativoPage extends StatelessWidget {
  const ClienteInativoPage({Key? key}) : super(key: key);

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.azul,
      ),
      body: Container(
        color: AppColors.azul,
        child: Column(
          children: [
            Center(
              child: Image.asset(
                AppAssets.logoLogin,
              ),
            ),
            const SizedBox(height: 100),
            Center(
              child: Image.asset(AppAssets.vector),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Sua conta está inativa',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 80, right: 50),
              child: Center(
                child: Text(
                  'Por favor entre em contato com a central do cliente',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 70),
            Center(
              child: Image.asset(
                AppAssets.ans3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: BotaoGrande(
                text: Constants.phoneCentralAtendimento,
                onTap: () async {
                  await makePhoneCall(Constants.phoneCentralAtendimento);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () {
                    log('Clicou');
                    Get.back();
                  },
                  child: const Text('Voltar')),
            )
          ],
        ),
      ),
    );
  }
}
