// ignore_for_file: prefer_const_constructors

import 'package:almaodonto/src/features/app/presentation/bindings/app_binding.dart';
import 'package:almaodonto/src/features/app/presentation/pages/app_page.dart';
import 'package:almaodonto/src/features/auth/presentation/bindings/login_binding.dart';
import 'package:almaodonto/src/features/auth/presentation/pages/cliente_ativo_page.dart';
import 'package:almaodonto/src/features/auth/presentation/pages/cliente_inativo_page.dart';
import 'package:almaodonto/src/features/auth/presentation/pages/login_page.dart';
import 'package:almaodonto/src/features/carteirinha/presentation/binding/carteirinha_binding.dart';
import 'package:almaodonto/src/features/carteirinha/presentation/pages/carteirinha_page.dart';
import 'package:almaodonto/src/features/consultorios/presentation/bindings/consultorios_binding.dart';
import 'package:almaodonto/src/features/consultorios/presentation/pages/consultorio_details_page.dart';
import 'package:almaodonto/src/features/consultorios/presentation/pages/consultorios_page.dart';
import 'package:almaodonto/src/features/consultorios/presentation/pages/result_consultorios.dart';
import 'package:almaodonto/src/features/contato/presentations/bindings/contato_binding.dart';
import 'package:almaodonto/src/features/contato/presentations/pages/contato_page.dart';
import 'package:almaodonto/src/features/perfil/presentations/bindings/perfil_binding.dart';
import 'package:almaodonto/src/features/perfil/presentations/pages/perfil_page.dart';
import 'package:get/get.dart';

import '../../features/auth/presentation/pages/splash_page.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(name: AppRoutes.CLIENTE_ATIVO, page: () => ClienteAtivoPage(), bindings: [
      LoginBinding(),
      AppBinding(),
    ]),
    GetPage(
      name: AppRoutes.CLIENTE_INATIVO,
      page: () => ClienteInativoPage(),
    ),
    GetPage(
      name: AppRoutes.APP,
      page: () => const AppPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRoutes.CARTEIRINHA,
      page: () => CarteirinhaPage(),
      binding: CarteirinhaBinding(),
    ),
    GetPage(
      name: AppRoutes.CONSULTORIOS,
      page: () => ConsultoriosPage(),
      binding: ConsultoriosBinding(),
    ),
    GetPage(
      name: AppRoutes.CONSULTORIOS_RESULT,
      page: () => ConsultoriosResultPage(),
      binding: ConsultoriosBinding(),
    ),
    GetPage(
      name: AppRoutes.CONSULTORIOS_DETAILS,
      page: () => ConsultoriosDetailsPage(),
      binding: ConsultoriosBinding(),
    ),
    GetPage(
      name: AppRoutes.PERFIL,
      page: () => PerfilPage(),
      binding: PerfilBinding(),
    ),
    GetPage(
      name: AppRoutes.CONTATO,
      page: () => ContatoPage(),
      binding: ContatoBinding(),
    ),
  ];
}
