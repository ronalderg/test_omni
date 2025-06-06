import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_omni/presentation/pages/home/home_controller.dart';
import 'package:test_omni/utils/extension/string.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              controller.onRefresh();
            },
            child: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: controller.scrollController,
                      shrinkWrap: true,
                      itemCount: controller.photoList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: CachedNetworkImage(
                                imageUrl:
                                    controller.photoList[index].thumbnailUrl,
                                imageBuilder: (context, imageProvider) =>
                                    Image(image: imageProvider),
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              title: Text(
                                capitalizeText(
                                  controller.photoList[index].title,
                                ),
                              ),
                            ),
                            const Divider(),
                          ],
                        );
                      },
                    ),
                  ),
                  if (controller.state.value == ViewState.gettingPhotos)
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
