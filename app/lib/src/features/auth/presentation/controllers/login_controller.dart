import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/routes/app_routes.dart';

class LoginController extends GetxController {
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController dataNascimentoController =
      TextEditingController();

  final _exibirSenha = false.obs;
  get exibirSenha => _exibirSenha.value;
  set exibirSenha(value) => _exibirSenha.value = value;

  final _carregandoLogin = true.obs;
  get carregandoLogin => _carregandoLogin.value;
  set carregandoLogin(value) => _carregandoLogin.value = value;

  final _salvarUsuario = false.obs;
  get salvarUsuario => _salvarUsuario.value;
  set salvarUsuario(value) => _salvarUsuario.value = value;

  final _messageErrorDio = ''.obs;
  get messageErrorDio => _messageErrorDio.value;
  set messageErrorDio(value) => _messageErrorDio.value = value;

  final _senha = ''.obs;
  get senha => _senha.value;
  set senha(value) => _senha.value = value;

  void checkUser() async {
    Future.delayed(const Duration(seconds: 3), () {
      carregandoLogin = false;
      Get.offAndToNamed(AppRoutes.LOGIN);
    });
  }

  void checkCpf() async {
    Future.delayed(const Duration(seconds: 3), () {
      carregandoLogin = false;
      Get.offAndToNamed(AppRoutes.CLIENTE_ATIVO);
    });
  }

  void login() async {
    Future.delayed(const Duration(seconds: 3), () {
      carregandoLogin = false;
      Get.offAndToNamed(AppRoutes.APP);
    });
  }

  @override
  void onInit() {
    super.onInit();
    //checkUser();
  }
}
