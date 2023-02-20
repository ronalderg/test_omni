import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:test_omni/gen/fonts.gen.dart';
import 'package:test_omni/presentation/routes/routes.dart';

/// Drawer Menu app
class DrawerHome extends StatelessWidget {
  ///Constructor
  const DrawerHome({
    super.key,
  });

  ///List user menu
  List<Widget> userMenu(){
    return [
      ColoredBox(
        color: Colors.black,
        child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(onPressed: (){},
                icon: const Icon(Icons.arrow_back, color: Colors.white,
                ),
            ),
        ),
      ),
      //const SizedBox(height: 15,),
      Container(
        color: Colors.black,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 36,
              child: CircleAvatar(
                radius: 34,
                child: Text('UserInfo',
                    style: TextStyle(
                      fontFamily: FontFamily.intervogue,
                      fontWeight: FontWeight.w600,
                    ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // ignore: inference_failure_on_function_invocation
                Get.offAllNamed(Routes.home);
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
              ),
              child: const Icon(Icons.edit, color: Colors.white),
            ),
          ],
        ),
      ),
      const SizedBox(height: 15,),

      buildDrawerItem(
        icon: Icons.check,
        text: 'hire'.tr,
        onTap: () => EasyLoading.showToast('isBestChoise'.tr),),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            children: userMenu(),
        ),
    );
  }

  ///Build a drawer item
  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(text),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }

  /// Navigate to other screens
  void navigate(String route, {Map<String, dynamic> arguments=const{}}) {
    // ignore: inference_failure_on_function_invocation
    Get.toNamed(
        route,
        arguments: arguments,
    );
  }
}
