import 'package:test_omni/presentation/routes/routes_import.dart';

/// Const strings routes
class Routes{
  /// Splash Screen
 static const String splash = '/splash';
 /// Home Screen
 static const String home = '/home';

}

///Model routing
class RoutePages{
  /// All pages in App
  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: Routes.splash,
      page: ()=> const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: Routes.home,
        page: ()=> const HomeScreen(),
        binding: HomeBinding(),
    ),
  ];
}
