import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_omni/presentation/routes/routes.dart';

///Splash controller
class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin{

  ///Animation Controller to animate splash
  AnimationController? animationController;
  ///Variable for animation
  late Animation<double> animation;

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      // ignore: inference_failure_on_function_invocation
      Get.toNamed(Routes.home);
    });
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = Tween(
      // ignore: prefer_int_literals
      begin: 0.0,
      // ignore: prefer_int_literals
      end: 1.0,
    ).animate(animationController!);
    super.onInit();
  }
}
