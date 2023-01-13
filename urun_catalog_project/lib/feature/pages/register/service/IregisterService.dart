import 'package:dio/dio.dart';
import 'package:urun_catalog_project/feature/pages/register/models/register_model.dart';

abstract class IRegisterService {
  final Dio dio;
  IRegisterService(this.dio);

  final String registerPath = IRegisterServicePath.REGISTER.rawValue;

  Future<RegisterModel?> postUserRegister(RegisterModel model);
}

enum IRegisterServicePath { REGISTER }

extension IRegisterServicePathExtension on IRegisterServicePath {
  String get rawValue {
    switch (this) {
      case IRegisterServicePath.REGISTER:
        return '/register';
    }
  }
}
