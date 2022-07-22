import 'package:almaodonto/src/config/themes/app_assets.dart';
import 'package:almaodonto/src/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/routes/app_routes.dart';
import '../controllers/login_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  final LoginController loginController = Get.find();

  loading() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(AppRoutes.LOGIN);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.azul,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    AppAssets.logoSplash,
                    fit: BoxFit.cover,
                    width: size.width / 3,
                    height: size.height / 3,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          loginController.carregandoLogin == true
              ? const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 6,
                )
              : SizedBox(
                  height: 5,
                )
        ],
      ),
    );
  }
}
