import 'package:almaodonto/src/config/themes/app_assets.dart';
import 'package:almaodonto/src/features/app/presentation/controllers/app_controller.dart';
import 'package:almaodonto/src/features/auth/presentation/widgets/botao_grande.dart';
import 'package:almaodonto/src/features/consultorios/presentation/controllers/consultorios_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsultoriosDetailsPage extends GetView<AppController> {
  const ConsultoriosDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        toolbarHeight: 120,
        centerTitle: true,
        actions: [
          Image.asset(
            AppAssets.smile,
            scale: .8,
          ),
        ],
        title: Image.asset(
          AppAssets.logoSplash,
          scale: 2.5,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  controller.clinica.name!,
                  style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  controller.clinica.address!,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  '${controller.clinica.district!} - ${controller.clinica.state!}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  controller.clinica.phone!,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(AppAssets.info),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                child: Text(controller.clinica.customText!),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Center(
                child: Image.asset(AppAssets.map),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: BotaoGrande(text: 'COMO CHEGAR', onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
