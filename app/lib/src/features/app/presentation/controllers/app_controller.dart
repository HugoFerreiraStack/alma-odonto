import 'dart:developer';

import 'package:almaodonto/src/features/app/domain/entities/clinicas.dart';
import 'package:almaodonto/src/features/app/domain/entities/search_clinics_params.dart';
import 'package:almaodonto/src/features/app/domain/entities/user_app.dart';
import 'package:almaodonto/src/features/app/domain/usecases/get_cidades_usecase.dart';
import 'package:almaodonto/src/features/app/domain/usecases/get_clinicas_usecase.dart';
import 'package:almaodonto/src/features/app/domain/usecases/get_estado_usecase.dart';
import 'package:almaodonto/src/features/app/domain/usecases/get_especialidades_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../auth/domain/entities/check_login_result.dart';
import '../../domain/entities/cidade_estado_entity.dart';
import '../../domain/entities/especialidades.dart';
import '../../domain/entities/estados_entity.dart';

class AppController extends GetxController with StateMixin<List<String>> {
  AppController(this.getEspecialidadesUsecase, this.getEstadoUsecase, this.getCidadesUsecase, this.getClinicasUsecase);

  static AppController get to => Get.find();

  final PageController pageController = PageController();
  final GlobalKey pageViewKey = GlobalKey();
  final GlobalKey bottomNavKey = GlobalKey();
  final GetEspecialidadesUsecase getEspecialidadesUsecase;
  final GetEstadosUsecase getEstadoUsecase;
  final GetCidadesUsecase getCidadesUsecase;
  final GetClinicasUsecase getClinicasUsecase;

  final _listEstados = <String>[].obs;
  List<String> get listEstados => _listEstados;
  set listEstados(List<String> value) => _listEstados.value = value;

  final _listCidades = <String>[].obs;
  List<String> get listCidades => _listCidades;
  set listCidades(List<String> value) => _listCidades.value = value;

  final _listEspecialidades = <String>[].obs;
  List<String> get listEspecialidades => _listEspecialidades;
  set listEspecialidades(List<String> value) => _listEspecialidades.value = value;

  final _currentPage = 0.obs;
  get currentPage => _currentPage.value;
  set currentPage(value) => _currentPage.value = value;

  final _isLogged = false.obs;
  get isLogged => _isLogged.value;
  set isLogged(value) => _isLogged.value = value;

  final _loggedUser = UserApp().obs;
  UserApp get loggedUser => _loggedUser.value;
  set loggedUser(UserApp value) => _loggedUser.value = value;

  final _estados = <EstadoEntity>[].obs;
  List<EstadoEntity> get estados => _estados;
  set estados(List<EstadoEntity> value) => _estados.value = value;

  final _especialidades = Especialidades().obs;
  Especialidades get especialidades => _especialidades.value;
  set especialidades(Especialidades value) => _especialidades.value = value;

  final _clinicas = Clinicas().obs;
  Clinicas get clinicas => _clinicas.value;
  set clinicas(Clinicas value) => _clinicas.value = value;

  final _clinica = Clinica().obs;
  Clinica get clinica => _clinica.value;
  set clinica(Clinica value) => _clinica.value = value;

  final _cidadeEstado = CidadeEstado().obs;
  CidadeEstado get cidadeEstado => _cidadeEstado.value;
  set cidadeEstado(CidadeEstado value) => _cidadeEstado.value = value;

  final _clienteAtivo = CheckLoginResult().obs;
  CheckLoginResult get clienteAtivo => _clienteAtivo.value;
  set clienteAtivo(CheckLoginResult value) => _clienteAtivo.value = value;

  final _estadoSelecionado = ''.obs;
  get estadoSelecionado => _estadoSelecionado.value;
  set estadoSelecionado(value) => _estadoSelecionado.value = value;

  final _cidadeSelecionada = ''.obs;
  get cidadeSelecionada => _cidadeSelecionada.value;
  set cidadeSelecionada(value) => _cidadeSelecionada.value = value;

  final _especialidadeSelecionada = ''.obs;
  get especialidadeSelecionada => _especialidadeSelecionada.value;
  set especialidadeSelecionada(value) => _especialidadeSelecionada.value = value;

  final _cpf = ''.obs;
  get cpf => _cpf.value;
  set cpf(value) => _cpf.value = value;

  void animateToPage(int page) {
    currentPage = page;
    pageController.jumpToPage(page);
  }

  Future<void> getEspecialidades() async {
    final result = await getEspecialidadesUsecase.execute();
    if (_listEspecialidades.isEmpty) change(null, status: RxStatus.loading());
    result.fold((l) => null, (r) {
      especialidades = r;
      listEspecialidades.clear();
      especialidades.data!.forEach((element) {
        listEspecialidades.add(element.specialty);
      });
      print(listEspecialidades);
      change(listEspecialidades, status: RxStatus.success());
    });
  }

  Future<void> getEstados() async {
    final result = await getEstadoUsecase.execute();
    if (_listEstados.isEmpty) change(null, status: RxStatus.loading());
    result.fold((l) => null, (r) {
      estados = r;
      listEstados.clear();
      estados.forEach((element) {
        listEstados.add(element.state!);
      });
      print(listEstados);
      change(listEstados, status: RxStatus.success());
    });
  }

  Future<void> getCidades() async {
    final result = await getCidadesUsecase.execute();
    if (_listCidades.isEmpty) change(null, status: RxStatus.loading());
    result.fold((l) => null, (r) {
      cidadeEstado = r;
      listCidades.clear();
      cidadeEstado.data!.forEach((element) {
        if (element.state == estadoSelecionado) {
          listCidades.add(element.city!);
        }
      });
      print(listCidades.toString());

      change(listCidades, status: RxStatus.success());
    });
  }

  Future<void> getClinicas() async {
    final SearchClinicParams params = SearchClinicParams(specialty: especialidadeSelecionada, state: estadoSelecionado, search: cidadeSelecionada);
    final result = await getClinicasUsecase.execute(params);

    result.fold((l) => null, (r) {
      clinicas = r;
      print(clinicas.data!.length.toString());
      Get.toNamed(AppRoutes.CONSULTORIOS_RESULT);
    });
  }

  @override
  void onInit() {
    getEstados();
    super.onInit();
  }
}
