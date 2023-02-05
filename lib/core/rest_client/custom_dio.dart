import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:dw9_delirery_app/core/config/env/env.dart';
import 'package:dw9_delirery_app/core/rest_client/interceptors/auth_interceptor.dart';

class CustomDio extends DioForNative {
  late AuthInterceptor _authInterceptor; 

  CustomDio() : super(BaseOptions(
    baseUrl: Env.i['backend_base_url'] ?? '',
    connectTimeout:  5000, // TODO: resposta de conexao
    receiveTimeout: 60000 // TODO: tempo de resposta 
  )){
    interceptors.add(LogInterceptor(
      responseBody:  true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true
    ));
    _authInterceptor = AuthInterceptor();
  }

  CustomDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}