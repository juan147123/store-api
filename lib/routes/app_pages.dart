
import 'package:store_api/modules/splash/splash_page.dart';
import 'package:get/get.dart';


part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;
  static const _transition = Transition.cupertino;


  static final routes = [
    // LOGIN
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashPage(),
      transition: _transition,
    ),

  ];
}
