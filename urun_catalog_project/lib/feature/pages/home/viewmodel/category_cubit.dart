import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:urun_catalog_project/feature/pages/register/models/register_model.dart';
import 'package:urun_catalog_project/feature/pages/register/service/IregisterService.dart';
import 'package:urun_catalog_project/model/category_models.dart';
import 'package:urun_catalog_project/service/categoryservice/ICategoryService.dart';

class CategoryCubit extends Cubit<CategoryState> {


  final ICategoryService service;

  bool isLoginFail = false;
  bool isLoading = false;
  CategoryCubit(
      {required this.service})
      : super(CategoryInitial());

  Future<void> postRegisterModel() async {
    
      changeLoadingView();
      final data = await service.postUserCategory();
      print(data?.category);
      changeLoadingView();
      if (data is CategoryModel) {
        emit(CategoryComplete(data));
      }
    
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(CategoryLoadingState(isLoading));
  }
}

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryComplete extends CategoryState {
  final CategoryModel model;
  CategoryComplete(this.model);
}

class CategoryValidateState extends CategoryState {
  final bool isValidate;
  CategoryValidateState(this.isValidate);
}

class CategoryLoadingState extends CategoryState {
  final bool isLoading;
  CategoryLoadingState(this.isLoading);
}
