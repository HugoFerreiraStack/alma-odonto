import 'dart:developer';

import 'package:almaodonto/src/config/themes/app_assets.dart';
import 'package:almaodonto/src/features/app/presentation/controllers/app_controller.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarteirinhaPage extends GetView<AppController> {
  const CarteirinhaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 25,
      ),
      body: SingleChildScrollView(
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
                            color: Colors.white,
                            width: 72,
                            height: 100,
                            child: Image.asset(AppAssets.photoPerfil, fit: BoxFit.cover),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              width: size.width * 0.6,
                              height: 80,
                            ),
                            Container(
                              color: Colors.white,
                              width: size.width * 0.67,
                              height: 20,
                              child: Obx(() {
                                return Text(
                                  controller.loggedUser.data!.name!,
                                  style: TextStyle(color: Colors.grey),
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          color: Colors.white,
                          width: 350,
                          height: 20,
                          child: Obx(() {
                            return Text(
                              controller.loggedUser.data!.document!,
                              style: TextStyle(color: Colors.grey),
                            );
                          }),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                color: Colors.white,
                                width: 200,
                                height: 20,
                                child: Text(
                                  controller.loggedUser.data!.company!,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                color: Colors.white,
                                width: 128,
                                height: 20,
                                child: Obx(() {
                                  return Text(
                                    controller.loggedUser.data!.birthday!,
                                    style: TextStyle(color: Colors.grey),
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
            // aqui
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
                  style: TextStyle(color: Colors.black, fontSize: 18),
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
              padding: EdgeInsets.only(left: 20),
              child: Text(
                controller.loggedUser.data!.name!,
                style: TextStyle(
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
              padding: EdgeInsets.only(left: 20),
              child: Text(
                controller.loggedUser.data!.walletDate.toString(),
                style: TextStyle(
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
              padding: EdgeInsets.only(left: 20),
              child: Text(
                controller.loggedUser.data!.company!,
                style: TextStyle(
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
            Row(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.loggedUser.data!.dependentes!.length,
                    itemBuilder: (context, index) {
                      return Expandable(
                        firstChild: Text(controller.loggedUser.data!.dependentes![index].name!),
                        secondChild: Text(controller.loggedUser.data!.dependentes![index].document!),
                        clickable: Clickable.firstChildOnly,
                        backgroundColor: Colors.white,
                        showArrowWidget: true,
                      );
                    }),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Padding(
            //       padding: EdgeInsets.only(left: 20),
            //       child: Text(
            //         'José Santos Pereira',
            //         style: TextStyle(
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         TextButton(
            //           onPressed: () {},
            //           style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
            //           child: const Icon(
            //             Icons.remove,
            //           ),
            //         ),
            //         TextButton(
            //           onPressed: () {},
            //           style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
            //           child: const Icon(
            //             Icons.add_outlined,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
