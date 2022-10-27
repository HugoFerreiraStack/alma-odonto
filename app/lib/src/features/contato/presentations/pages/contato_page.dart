import 'package:almaodonto/src/config/themes/app_assets.dart';
import 'package:almaodonto/src/config/themes/app_colors.dart';
import 'package:almaodonto/src/features/contato/presentations/controllers/contato_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContatoPage extends GetView<ContatoController> {
  const ContatoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: size.height,
                child: Image.asset(
                  AppAssets.background,
                  fit: BoxFit.cover,
                  opacity: const AlwaysStoppedAnimation<double>(0.2),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: size.width,
                    height: 120,
                    alignment: Alignment.topCenter,
                    decoration: const BoxDecoration(
                      color: AppColors.azul,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Image.asset(
                      AppAssets.logoContato,
                      scale: 1.5,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Center(
                    child: Text(
                      'Fale conosco',
                      style: TextStyle(
                          color: AppColors.azul,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Entre em contato da melhor forma pra você',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        //fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Image.asset(AppAssets.phone),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Telefone:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        //fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      '+55 00 0000-0000',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        //fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Whatsapp:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        //fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      '00 0000-0000',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        //fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(AppAssets.email),
                  ),
                  const Center(
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        //fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Center(
                    child: Text(
                      'suporte@almaodonto.com',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        //fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Center(
                    child: Text(
                      'suporte@almaodonto.com',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        //fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
