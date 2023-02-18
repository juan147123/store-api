
import 'package:store_api/modules/splash/splash_page.dart';
import 'package:get/get.dart';


part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;
  static const _transition = Transition.cupertino;


  static final routes = [
    // splash
    GetPage(
      name: AppRoutes.splash,
      page: () => splashPage(),
      transition: _transition,
    ),

  ];
}
