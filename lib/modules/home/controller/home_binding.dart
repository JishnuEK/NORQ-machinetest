import 'package:get/get.dart';
import 'package:test16032024/modules/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
