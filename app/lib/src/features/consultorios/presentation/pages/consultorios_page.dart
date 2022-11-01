import 'package:almaodonto/src/config/routes/app_routes.dart';
import 'package:almaodonto/src/config/themes/app_colors.dart';
import 'package:almaodonto/src/features/app/domain/entities/cidade_estado_entity.dart';
import 'package:almaodonto/src/features/app/presentation/controllers/app_controller.dart';
import 'package:almaodonto/src/features/auth/presentation/widgets/botao_grande.dart';
import 'package:almaodonto/src/features/auth/presentation/widgets/input_form.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../app/domain/entities/estados_entity.dart';

class ConsultoriosPage extends GetView<AppController> {
  const ConsultoriosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getEstados();
    controller.getEspecialidades();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.blue,
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Consultórios',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Center(
                    child: Text(
                      'Encontre os consultórios mais próximos de você',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Estado',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: controller.obx((_) => TextDropdownFormField(
                              options: controller.listEstados,
                              decoration: const InputDecoration(suffixIcon: Icon(Icons.arrow_drop_down), hintText: 'Selecione'),
                              dropdownHeight: 120,
                              onChanged: (dynamic str) {
                                controller.estadoSelecionado = str;
                                controller.listCidades.clear();
                                print(controller.estadoSelecionado);
                                controller.getCidades();
                              },
                            ))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Cidade',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: controller.estadoSelecionado != null
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: controller.obx((_) => TextDropdownFormField(
                                  options: controller.listCidades,
                                  decoration: const InputDecoration(suffixIcon: Icon(Icons.arrow_drop_down), hintText: 'Selecione'),
                                  dropdownHeight: 120,
                                  onChanged: (dynamic str) {
                                    controller.cidadeSelecionada = str;
                                    print(controller.cidadeSelecionada);
                                  },
                                )))
                        : Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: const Text(
                                'Cidade',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Especialidade',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: controller.obx((_) => TextDropdownFormField(
                              options: controller.listEspecialidades,
                              decoration: const InputDecoration(suffixIcon: Icon(Icons.arrow_drop_down), hintText: 'Selecione'),
                              dropdownHeight: 120,
                              onChanged: (dynamic str) {
                                controller.especialidadeSelecionada = str;

                                print(controller.especialidadeSelecionada);
                              },
                            ))),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BotaoGrande(
                    text: 'Encontrar',
                    onTap: () {
                      controller.getClinicas();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
