import 'package:test16032024/common/general.dart';
import 'package:test16032024/modules/home/model/product_model.dart';
import 'package:test16032024/repository/api/api_result.dart';
import 'package:test16032024/repository/api/network_exceptions.dart';
import 'package:test16032024/repository/api_repository.dart';

class HomeRepository extends APIRepository {
  String _MODULE_LABEL = "[HomeRepository]";

  Future<ApiResult<List<Product>>> getProducts() async {
    const fLabel = 'getProducts';

    try {
      final response = await dioClient.get(
        url.PRODUCTS,
      );

      List<Product> data = productFromJson(response);

      return ApiResult.success(data);
    } catch (e, s) {
      printLog(
          '$_MODULE_LABEL:$fLabel:${(NetworkExceptions.getDioException(e))}-$s',
          priority: LOG_LEVEL.ERROR);

      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
