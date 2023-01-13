import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:urun_catalog_project/feature/pages/register/models/register_model.dart';
import 'package:urun_catalog_project/feature/pages/register/service/IregisterService.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final GlobalKey<FormState> formKey;
  final IRegisterService service;

  bool isLoginFail = false;
  bool isLoading = false;
  RegisterCubit(this.emailController, this.passwordController,
      this.nameController, this.formKey,
      {required this.service})
      : super(RegisterInitial());

  Future<void> postRegisterModel() async {
    if (formKey.currentState?.validate() ?? false) {
      changeLoadingView();
      final data = await service.postUserRegister(RegisterModel(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text));
      print(data?.name);
      changeLoadingView();
      if (data is RegisterModel) {
        emit(RegisterComplete(data));
      }
    } else {
      isLoginFail = true;
      emit(RegisterValidateState(isLoginFail));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(RegisterLoadingState(isLoading));
  }
}

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterComplete extends RegisterState {
  final RegisterModel model;
  RegisterComplete(this.model);
}

class RegisterValidateState extends RegisterState {
  final bool isValidate;
  RegisterValidateState(this.isValidate);
}

class RegisterLoadingState extends RegisterState {
  final bool isLoading;
  RegisterLoadingState(this.isLoading);
}
