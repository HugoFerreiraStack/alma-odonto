import 'dart:developer';

import 'package:almaodonto/src/config/themes/app_assets.dart';
import 'package:almaodonto/src/features/app/presentation/controllers/app_controller.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CarteirinhaPage extends GetView<AppController> {
  const CarteirinhaPage({Key? key}) : super(key: key);

  buildData(String data) {
    DateTime dt = DateTime.parse(data);

    String formattedDate = DateFormat('dd/MM/yyyy').format(dt);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                height: 80,
                decoration: const BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                child: Center(
                  child: Image.asset(AppAssets.carteirinhaLogo),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              color: Colors.blue,
                              width: 90,
                              height: 100,
                              child: Image.asset(
                                AppAssets.photoPerfil,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                width: size.width * 0.6,
                                height: 80,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  color: Colors.white,
                                  width: size.width * 0.60,
                                  height: 20,
                                  child: Obx(() {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        controller.loggedUser.data!.name!,
                                        style: const TextStyle(color: Colors.grey),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Container(
                              color: Colors.white,
                              width: 350,
                              height: 20,
                              child: Obx(() {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    controller.loggedUser.data!.document!,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                );
                              }),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  color: Colors.white,
                                  width: 200,
                                  height: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      controller.loggedUser.data!.company!,
                                      style: const TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  color: Colors.white,
                                  width: 120,
                                  height: 20,
                                  child: Obx(() {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        buildData(controller.loggedUser.data!.birthday!),
                                        style: const TextStyle(color: Colors.grey),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  child: const Text(
                    'Numero da carteirinha',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  child: Text(
                    controller.loggedUser.data!.wallet!,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'Dados do Usuário',
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Nome',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  controller.loggedUser.data!.name!,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Data de vigencia do contrato',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  buildData(controller.loggedUser.data!.walletDate.toString()),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Empresa',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  controller.loggedUser.data!.company!,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Dependentes',
                  style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.loggedUser.data!.dependentes!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Expandable(
                      firstChild: Text(controller.loggedUser.data!.dependentes![index].name!),
                      secondChild: Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 20),
                        child: Text(controller.loggedUser.data!.dependentes![index].document!),
                      ),
                      clickable: Clickable.firstChildOnly,
                      backgroundColor: Colors.white,
                      showArrowWidget: true,
                      centralizeFirstChild: false,
                    ),
                  );
                },
              ),

              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'José Santos Pereira',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black)),
                        child: const Icon(
                          Icons.remove,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black)),
                        child: const Icon(
                          Icons.add_outlined,
                        ),
                      ),
                    ],
                  ),
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
