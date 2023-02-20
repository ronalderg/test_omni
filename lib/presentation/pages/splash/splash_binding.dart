import 'package:get/get.dart';
import 'package:test_omni/presentation/pages/splash/splash_controller.dart';

/// Splash Binding
class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(
      SplashController.new,
    );
  }

}
