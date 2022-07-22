import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'src/config/routes/app_pages.dart';
import 'src/config/routes/app_routes.dart';
import 'src/features/app/presentation/bindings/app_binding.dart';

void main() async {
  await GetStorage.init();
  AppBinding().dependencies();
  runApp(const AlmaOdonto());
}

class AlmaOdonto extends StatelessWidget {
  const AlmaOdonto({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', ''),
        Locale('en', ''),
      ],
      title: 'Alma Odonto',
      getPages: AppPages.pages,
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.SPLASH,
    );
  }
}
