import 'package:get/get.dart';
import 'package:test16032024/modules/cart/controller/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController(), permanent: true);
  }
}
