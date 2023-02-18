import 'package:store_api/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splashPage extends StatelessWidget {
  final _conX = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        
      ),
    );
  }
}
