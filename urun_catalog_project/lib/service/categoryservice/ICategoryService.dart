import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:urun_catalog_project/feature/pages/login/models/login_request_model.dart';
import 'package:urun_catalog_project/feature/pages/login/models/token_model.dart';
import 'package:urun_catalog_project/model/category_models.dart';

abstract class ICategoryService {
  final Dio dio;
  ICategoryService(this.dio);

  final String categoryPath = ICategoryServicePath.CATEGORIES.rawValue;

  Future<CategoryModel?> postUserCategory();
}

enum ICategoryServicePath { CATEGORIES }

extension ILoginServicePathExtension on ICategoryServicePath {
  String get rawValue {
    switch (this) {
      case ICategoryServicePath.CATEGORIES:
        return '/categories';
    }
  }
}
