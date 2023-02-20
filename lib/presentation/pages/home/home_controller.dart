import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:test_omni/core/error/failures.dart';
import 'package:test_omni/data/data_sources/implementation/photo_datasource_impl.dart';
import 'package:test_omni/domain/model/photo.dart';
import 'package:test_omni/domain/repository/implementation/photo_repository_impl.dart';
import 'package:test_omni/domain/use_cases/photo/get_photos.dart';

///State for manage
enum ViewState {
  /// Initial State
  initialState,

  /// State for get more photos
  gettingPhotos,

  /// Loaded Photos
  photosLoaded,
}

/// View Controller
class HomeController extends GetxController {
  ///
  static const limitRequest = 10;

  /// Scaffold to manage
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// Scroll controller to handle queries
  ScrollController scrollController = ScrollController();

  /// Photo list to show in Listview
  RxList<Photo> photoList = <Photo>[].obs;

  /// Photo list to show in Listview
  //final Rx<ViewState> state = Rx(ViewState.initialState).obs;
  final Rx<ViewState> state = ViewState.initialState.obs;

  /// Offset of request
  int offset = 0;

  @override
  void onInit() {
    scrollController.addListener(pagination);
    getPhotos();
    super.onInit();
  }

  ///Detect when the scrollController is at the end of ListView
  void pagination() {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        state.value != ViewState.gettingPhotos) {
      getPhotos();
    }
  }

  /// Open Drawer
  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  /// Close Drawer
  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  ///Get photos and add to list
  Future<void> getPhotos() async {
    state
      ..value = ViewState.gettingPhotos
      ..refresh();
    final getPhotos = GetPhotosImpl(PhotoRepositoryImpl(PhotoDataSourceImpl()));
    final result = await getPhotos.execute(
      start: photoList.length,
      limit: limitRequest,
    );

    result.fold((failure) {
      if (failure == ServerFailure()) {
        EasyLoading.showError('Error to get info'.tr);
      }
    }, (data) {
      photoList.addAll(data);
    });
    state
      ..value = ViewState.photosLoaded
      ..refresh();
    photoList.refresh();
  }

  void onRefresh(){
    photoList.value = [];
    getPhotos();
  }
}
