import 'package:almaodonto/src/features/app/presentation/controllers/app_controller.dart';
import 'package:almaodonto/src/features/carteirinha/presentation/controllers/carteirinha_controller.dart';
import 'package:get/get.dart';

import '../../../../core/utils/dio_helper.dart';
import '../../../app/data/app_repository_impl.dart';
import '../../../app/domain/repositories/app_repository.dart';
import '../../../app/domain/usecases/get_cidades_usecase.dart';
import '../../../app/domain/usecases/get_clinicas_usecase.dart';
import '../../../app/domain/usecases/get_estado_usecase.dart';
import '../../../app/domain/usecases/get_especialidades_usecase.dart';

class CarteirinhaBinding implements Bindings {
  @override
  void dependencies() {
    final AppRepository appRepository = AppRepositoryImpl(Get.find<CustomDio>());
    final GetEstadosUsecase getCidadeEstadoUsecase = GetEstadosUsecase(appRepository);
    final GetCidadesUsecase getCidadesUsecase = GetCidadesUsecase(appRepository);
    final GetClinicasUsecase getClinicasUsecase = GetClinicasUsecase(appRepository);

    final GetEspecialidadesUsecase getEspecialidadesUsecase = GetEspecialidadesUsecase(appRepository);
    Get.lazyPut<AppController>(() => AppController(getEspecialidadesUsecase, getCidadeEstadoUsecase, getCidadesUsecase, getClinicasUsecase));
  }
}
