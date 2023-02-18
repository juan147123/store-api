import 'package:store_api/config/config.dart';
import 'package:store_api/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class InstanceBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    final Dio dio = Dio();

    Get.put(DioClient(
      Config.urlApiStore,
      dio,
    ));
  }
}
