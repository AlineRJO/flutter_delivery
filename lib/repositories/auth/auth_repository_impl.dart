import 'dart:developer';

import 'package:dw9_delirery_app/core/exceptions/repository_exception.dart';
import 'package:dw9_delirery_app/core/exceptions/unauthorized_exceptions.dart';
import 'package:dw9_delirery_app/core/rest_client/custom_dio.dart';
import 'package:dw9_delirery_app/models/auth_model.dart';
import 'package:dio/dio.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({
    required this.dio,
  });

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await dio.unauth().post('/auth', data: {
        'password': password,
        'email': email,
      });
      return AuthModel.fromMap(result.data);
    } on DioError catch (e, s) {
     

      if(e.response?.statusCode == 403) {
         log('Permisaão negada', error: e, stackTrace: s);
         throw UnauthorizedExceptions();
      }
      throw RepositoryException(message: 'Error ao logar');
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await dio.unauth().post('/users', data: {
        'name': name,
        'password': password,
        'email': email,
      });
    } on DioError catch (e, s) {
      log('Erro ao registrar', error: e, stackTrace: s);
      throw RepositoryException(message: 'Error ao registrar');
    }
  }
}
