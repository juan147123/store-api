import 'package:store_api/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: use_key_in_widget_constructors, camel_case_types
class splashPage extends StatelessWidget {
  final _conX = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        id: _conX.gbSplashPage,
        builder: (_) {
          return Scaffold(
            body: SizedBox(
              width: double.infinity,
              child: Column(children: [
                Expanded(
                    child: Align(
                  alignment: Alignment.center,
                  child: Text("test"),
                )),
                Expanded(
                    child: Align(
                  alignment: Alignment.center,
                  child: AnimatedBuilder(
                    animation: _conX.animationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.rotate(
                        angle: _conX.rotationAnimation.value,
                        child: Image.asset('assets/img/shop_splash.png',
                            fit: BoxFit.fitWidth, width: 300),
                      );
                    },
                  ),
                )),
                Expanded(
                    child: Align(
                  alignment: Alignment.center,
                  child: Text("test"),
                ))
              ]),
            ),
          );
        });
  }
}
