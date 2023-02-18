import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:store_api/utils/utils.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final gbSplashPage = "gbSplashPage";
  final logoCacheLoaded = false.obs;

  late AnimationController animationController;
  late Animation<double> animation;
    late Animation<double> rotationAnimation;

  @override
  void onInit() {
    super.onInit();
    _preloadAndAnalyzeSession();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    rotationAnimation = Tween<double>(begin: 0, end: 2 * pi)
        .animate(animationController);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  Future<void> _preloadAndAnalyzeSession() async {
    logoCacheLoaded.value = true;
    await Helpers.sleep(1900);
  }
}
