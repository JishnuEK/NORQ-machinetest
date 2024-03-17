import 'package:dio/dio.dart';

// const String token =
//     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOiIxIn0.Jqj5PzSKplFJEqd83VGciYKHy2_BJ2QBry4rBwCMsFM';

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = getCustomheader();
    super.onRequest(options, handler);
  }

//  @override
//   onResponse(Response response, ResponseInterceptorHandler handler) {
//     return super.onResponse(response, handler);
//   }

//   @override
//   onError(DioError err, ErrorInterceptorHandler handler) {
//     // var url = err.request.uri;
//     print("************************************************");
//     print(err);

//     super.onError(err, handler);
//     if (err.response!.statusCode == 401) {
//       AuthService authservice = new AuthService();
//       authservice.logout();
//       locator<NavigationService>().navigateTo(Routes.root);
//     }
//   }

//////
  Map<String, String> getCustomheader() {
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return header;
  }
}
