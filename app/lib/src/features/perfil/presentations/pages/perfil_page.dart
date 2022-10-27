import 'package:almaodonto/src/config/themes/app_assets.dart';
import 'package:almaodonto/src/features/auth/presentation/widgets/botao_grande.dart';
import 'package:almaodonto/src/features/perfil/presentations/controllers/perfil_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerfilPage extends GetView<PerfilController> {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: 60,
                  alignment: Alignment.centerRight,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Image.asset(
                    AppAssets.smile,
                    height: 80,
                  ),
                ),
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(AppAssets.photoPerfil),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            RichText(
              text: const TextSpan(
                text: 'Bem-vinda, ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Alice',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Nome',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Alice Santos Pereira',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Data de nascimento',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      '00/00/0000',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: BotaoGrande(
                text: 'CARTEIRINHA',
                onTap: (() {}),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'ALTERAR SENHA',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
