import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/route_manager.dart';
import 'package:test_omni/core/traslations/localizaton_service.dart';
import 'package:test_omni/presentation/main_binding.dart';
import 'package:test_omni/presentation/routes/routes.dart';
import 'package:test_omni/presentation/theme.dart';

///Main App
class App extends StatelessWidget {
  ///Constr
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.locale,
      translations: LocalizationService(),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: RoutePages.pages,
      initialBinding: MainBinding(),
      theme: AppTheme.light,
    );
  }
}
