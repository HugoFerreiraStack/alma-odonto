import 'package:almaodonto/src/features/app/data/app_repository_impl.dart';
import 'package:almaodonto/src/features/app/domain/repositories/app_repository.dart';
import 'package:almaodonto/src/features/app/domain/usecases/get_cidades_usecase.dart';
import 'package:almaodonto/src/features/app/domain/usecases/get_clinicas_usecase.dart';
import 'package:almaodonto/src/features/app/domain/usecases/get_estado_usecase.dart';
import 'package:almaodonto/src/features/app/domain/usecases/get_especialidades_usecase.dart';
import 'package:get/get.dart';

import '../../../../core/utils/dio_helper.dart';

import '../controllers/app_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CustomDio>(CustomDio(), permanent: true);
    final AppRepository appRepository = AppRepositoryImpl(Get.find<CustomDio>());
    final GetEstadosUsecase getEstadosUsecase = GetEstadosUsecase(appRepository);
    final GetCidadesUsecase getCidadesUsecase = GetCidadesUsecase(appRepository);
    final GetClinicasUsecase getClinicasUsecase = GetClinicasUsecase(appRepository);
    final GetEspecialidadesUsecase getEspecialidadesUsecase = GetEspecialidadesUsecase(appRepository);
    Get.put<AppController>(AppController(getEspecialidadesUsecase, getEstadosUsecase, getCidadesUsecase, getClinicasUsecase));
  }
}
