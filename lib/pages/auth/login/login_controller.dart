
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dw9_delirery_app/core/exceptions/unauthorized_exceptions.dart';
import 'package:dw9_delirery_app/pages/auth/login/login_state.dart';
import 'package:dw9_delirery_app/repositories/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Cubit<LoginState>{
  final AuthRepository _authRepository;

  LoginController(this._authRepository): super(const LoginState.initial());
  
  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(status: LoginStatus.login));
      final authModel = await _authRepository.login(email, password);
      final sp = await SharedPreferences.getInstance();
      sp.setString('accessToken', authModel.accessToken);
      sp.setString('refreshToken', authModel.refreshToken);
      emit(state.copyWith(status: LoginStatus.sucess));
    } on UnauthorizedExceptions catch (e, s) {
        log('Login e senha inválidos', error: e, stackTrace: s);
        emit(state.copyWith(status: LoginStatus.error, errorMessage: 'Login ou senha inválidos'));
    } catch (e, s) {
        log('Erro ao realizar o login', error: e, stackTrace: s);
        emit(state.copyWith(status: LoginStatus.error, errorMessage: 'Login ao realizar o login'));
    }
  }
}