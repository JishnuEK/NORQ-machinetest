import 'package:get/get.dart';
import 'package:test16032024/local_storage/local_storage_cache.dart';
import 'package:test16032024/modules/cart/model/cart.dart';

class CartController extends GetxController {
  String get WidgetID => 'WidgetID';

  List<Cart> cartList = [];

  @override
  Future<void> onInit() async {
    super.onInit();

    getCart();
  }

  getCart() {
    cartList.clear();
    cartList.addAll(LocalStorageCache.getProductfromCart());
    getTotal();
  }

  delete(id) {
    LocalStorageCache.deleteItem(id);
    getCart();
  }

  incrementCartQuantity(Cart item) {
    LocalStorageCache.increment(item);
    getCart();
  }

  decrementCartQuantity(Cart item) {
    if (item.quantity > 1) {
      LocalStorageCache.decrement(item);
      getCart();
    }
  }

  double total = 0;

  getTotal() {
    total = 0;

    for (var item in cartList) {
      total = total + (item.price * item.quantity);
    }
    update([WidgetID]);
  }
}
