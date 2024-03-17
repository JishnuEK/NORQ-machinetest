import 'package:dio/dio.dart';
import 'package:test16032024/repository/api/dio_client.dart';
import 'package:test16032024/repository/api/interceptors/authorization_interceptor.dart';
import 'package:test16032024/repository/urlpool.dart';

//#########

const String _baseUrl = "https://fakestoreapi.com/";

//#########

class APIRepository {
  late DioClient dioClient;
  late URLPool url;
  APIRepository() {
    var dio = Dio();
    dioClient = DioClient(
      _baseUrl,
      dio,
      interceptors: [
        AuthorizationInterceptor(),
      ],
    );
    url = URLPool();
  }
}
