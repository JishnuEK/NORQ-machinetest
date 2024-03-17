import 'package:get/get.dart';
import 'package:test16032024/common/general.dart';
import 'package:test16032024/local_storage/local_storage_cache.dart';
import 'package:test16032024/modules/home/model/product_model.dart';
import 'package:test16032024/modules/home/repository/home_repo.dart';
import 'package:test16032024/repository/api/api_result.dart';
import 'package:test16032024/repository/api/network_exceptions.dart';

class HomeController extends GetxController {
  //------------
  String get ProductWidget => 'ProductWidget';
  bool isLoading = true;
  List<Product> productList = [];
  @override
  Future<void> onInit() async {
    super.onInit();
    getProducts();
  }

  onNavigate(Product) {}
  addTocart(Product item) {
    LocalStorageCache.saveProductToCart(item);
    CustomAlert.defaultSnackbar('Added to cart');
  }

//
  getProducts() async {
    isLoading = (true);
    update([ProductWidget]);
    ApiResult<List<Product>> apiResult = await HomeRepository().getProducts();
    apiResult.when(success: (List<Product> data) {
      if (data != null) {
        productList.clear();

        productList.addAll(data);
      }

      isLoading = (false);

      update([ProductWidget]);
    }, failure: (NetworkExceptions error) {
      CustomAlert.ErrorSnackbar(NetworkExceptions.getErrorMessage(error));

      isLoading = (false);

      update([ProductWidget]);
    });
  }
}

class SuccessSnackbar {}
