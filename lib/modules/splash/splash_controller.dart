import 'package:store_api/routes/app_pages.dart';
import 'package:store_api/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  // final authX = Get.find<AuthController>();
  late Image logoWhiteCache;
  late Image loginBgCache;

  final logoCacheLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    _preloadAndAnalyzeSession();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _preloadAndAnalyzeSession() async {
    logoCacheLoaded.value = true;
     await Helpers.sleep(1900);
  }
}
