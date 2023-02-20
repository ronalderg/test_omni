import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_omni/gen/fonts.gen.dart';
import 'package:test_omni/presentation/pages/home/drawer_home.dart';
import 'package:test_omni/presentation/pages/home/home_controller.dart';
import 'package:test_omni/presentation/pages/home/home_view.dart';

///Home screen
class HomeScreen extends GetWidget<HomeController> {
  ///Constructor
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: controller.scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            color: Colors.white,
            onPressed: () {
              controller.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          title: const Text(
            'onmi.pro',
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontFamily.intervogue,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          //titleTextStyle: TextStyle(),
        ),
        drawer: const DrawerHome(),
        body: const HomeView(),
      ),
    );
  }
}
