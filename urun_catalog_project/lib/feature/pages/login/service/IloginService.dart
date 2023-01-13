import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:urun_catalog_project/feature/pages/login/models/login_request_model.dart';
import 'package:urun_catalog_project/feature/pages/login/models/token_model.dart';

abstract class ILoginService {
  final Dio dio;
  ILoginService(this.dio);

  final String loginPath = IloginServicePath.LOGIN.rawValue;

  Future<tokenModel?> postUserLogin(LoginRequestModel model);
}

enum IloginServicePath { LOGIN }

extension ILoginServicePathExtension on IloginServicePath {
  String get rawValue {
    switch (this) {
      case IloginServicePath.LOGIN:
        return '/login';
    }
  }
}
