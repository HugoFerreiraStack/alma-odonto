import 'package:almaodonto/src/config/routes/app_routes.dart';
import 'package:almaodonto/src/config/themes/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/consultorios_controller.dart';

class ConsultoriosResultPage extends GetView<ConsultoriosController> {
  const ConsultoriosResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        toolbarHeight: 120,
        title: Image.asset(AppAssets.consultorioResult),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: "Pesquisar",
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.amber,
                      ),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                  onChanged: (text) {},
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.CONSULTORIOS_DETAILS);
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Clínica São Gabriel',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                          'Avenida Brasil, 1500',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Jardins - São Paulo',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          '(11) 0000-0000',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
