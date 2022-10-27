import 'package:almaodonto/src/config/routes/app_routes.dart';
import 'package:almaodonto/src/config/themes/app_colors.dart';
import 'package:almaodonto/src/features/auth/presentation/widgets/botao_grande.dart';
import 'package:almaodonto/src/features/auth/presentation/widgets/input_form.dart';
import 'package:almaodonto/src/features/consultorios/presentation/controllers/consultorios_controller.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConsultoriosPage extends GetView<ConsultoriosController> {
  const ConsultoriosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InputForm(
                    color: AppColors.azul,
                    //controller: controller.dataNascimentoController,
                    hintText: 'São Paulo',
                    hintColor: Colors.grey,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      DataInputFormatter()
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Cidade',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InputForm(
                    color: AppColors.azul,
                    //controller: controller.dataNascimentoController,
                    hintText: 'Campinas',
                    hintColor: Colors.grey,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      DataInputFormatter()
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Especialidade',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InputForm(
                        color: AppColors.azul,
                        //controller: controller.dataNascimentoController,
                        hintText: 'Odontologia',
                        hintColor: Colors.grey,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          DataInputFormatter()
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BotaoGrande(
                    text: 'Encontrar',
                    onTap: () {
                      Get.toNamed(AppRoutes.CONSULTORIOS_RESULT);
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
