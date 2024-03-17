import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test16032024/modules/cart/model/cart.dart';
import 'package:test16032024/modules/home/model/product_model.dart';
import 'package:test16032024/modules/login/model/userdata.dart';

late Box boxCart;
late Box boxUser;

class LocalStorageCache {
  //USER
  static saveUserCache({
    required User user,
  }) {
    boxUser.put('CurrentUser', UserData(userEmail: user.email!));
  }

  static getUserCache() {
    try {
      print(boxUser.get('CurrentUser'));
      return boxUser.get('CurrentUser');
    } catch (e) {
      return null;
    }
  }

  static clearData() {
    boxCart.clear();
    boxUser.clear();
  }

//----CART
  static saveProductToCart(Product i) {
    boxCart.put(
        'cart_product_${i.id}',
        Cart(
            name: i.title,
            id: i.id,
            image: i.image,
            price: i.price,
            quantity: 1));
  }

  static increment(
    Cart i,
  ) {
    boxCart.put(
        'cart_product_${i.id}',
        Cart(
            name: i.name,
            id: i.id,
            image: i.image,
            price: i.price,
            quantity: i.quantity + 1));
  }

  static decrement(
    Cart i,
  ) {
    boxCart.put(
        'cart_product_${i.id}',
        Cart(
            name: i.name,
            id: i.id,
            image: i.image,
            price: i.price,
            quantity: i.quantity - 1));
  }

  static deleteItem(id) {
    boxCart.delete('cart_product_${id}');
  }

  static List<Cart> getProductfromCart() {
    try {
      return boxCart.values.toList() as List<Cart>;
    } catch (e) {
      return [];
    }
  }
}
