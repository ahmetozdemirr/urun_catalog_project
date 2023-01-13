import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:urun_catalog_project/feature/pages/login/models/login_request_model.dart';
import 'package:urun_catalog_project/feature/pages/login/models/token_model.dart';
import 'package:urun_catalog_project/feature/pages/login/service/IloginService.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  final ILoginService service;

  bool isLoginFail = false;
  bool isLoading = false;

  LoginCubit(this.formKey, this.emailController, this.passwordController,
      {required this.service})
      : super(LoginInitial());

  Future<void> postUserModel() async {
    if (formKey.currentState?.validate() ?? false) {
      changeLoadingView();
      final data = await service.postUserLogin(LoginRequestModel(
          email: emailController.text, password: passwordController.text));
      print(data?.actionLogin?.token.toString());
      changeLoadingView();

      if (data is tokenModel) {
        emit(LoginComplete(data));
      }
    } else {
      isLoginFail = true;
      emit(LoginValidateState(isLoginFail));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(LoginLoadingState(isLoading));
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginComplete extends LoginState {
  final tokenModel model;
  LoginComplete(this.model);
}

class LoginValidateState extends LoginState {
  final bool isValidate;
  LoginValidateState(this.isValidate);
}

class LoginLoadingState extends LoginState {
  final bool isLoading;
  LoginLoadingState(this.isLoading);
}
