import 'package:get/get.dart';
import 'package:test_omni/presentation/pages/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(
          HomeController.new,
    );
  }

}
