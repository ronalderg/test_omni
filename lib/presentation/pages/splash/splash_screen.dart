import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_omni/gen/assets.gen.dart';
import 'package:test_omni/presentation/pages/splash/splash_controller.dart';

/// Splash Screen
class SplashScreen extends GetWidget<SplashController> {
  ///Constructor
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // ignore: use_colored_box
      body: Container(
        color: Colors.black,
        child: Center(
          child: Assets.images.logoOmni.image(),
        ),
      ),
    );
  }
}
