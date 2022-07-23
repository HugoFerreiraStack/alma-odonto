// ignore_for_file: prefer_const_constructors

import 'package:almaodonto/src/features/app/presentation/controllers/app_controller.dart';
import 'package:almaodonto/src/features/carteirinha/presentation/pages/carteirinha_page.dart';
import 'package:almaodonto/src/features/consultorios/presentation/pages/consultorios_page.dart';
import 'package:almaodonto/src/features/contato/presentations/pages/contato_page.dart';
import 'package:almaodonto/src/features/perfil/presentations/pages/perfil_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../config/themes/app_assets.dart';
import '../../../../config/themes/app_colors.dart';

class AppPage extends GetView<AppController> {
  const AppPage({Key? key}) : super(key: key);

  static List<Widget> pages = const [
    CarteirinhaPage(),
    ConsultoriosPage(),
    PerfilPage(),
    ContatoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return Container(
            key: controller.bottomNavKey,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                onTap: (index) {
                  controller.animateToPage(index);
                },
                currentIndex: controller.currentPage,
                // ignore: prefer_const_literals_to_create_immutables
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      AppAssets.carteirinha,
                      width: 60,
                    ),
                    label: '',
                    activeIcon: Image.asset(AppAssets.carteirinha,
                        width: 60, color: AppColors.azul),
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(AppAssets.consultorios),
                    label: '',
                    activeIcon: Image.asset(AppAssets.consultorios,
                        color: AppColors.azul),
                  ),
                  BottomNavigationBarItem(
                      icon: Image.asset(AppAssets.perfil),
                      label: '',
                      activeIcon:
                          Image.asset(AppAssets.perfil, color: AppColors.azul)),
                  BottomNavigationBarItem(
                      icon: Image.asset(AppAssets.contato),
                      label: '',
                      activeIcon:
                          Image.asset(AppAssets.contato, color: AppColors.azul))
                ],
              ),
            ));
      }),
      body: PageView(
        key: controller.pageViewKey,
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),
    );
  }
}
