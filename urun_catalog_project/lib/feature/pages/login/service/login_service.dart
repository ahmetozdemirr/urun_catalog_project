

import 'package:urun_catalog_project/feature/pages/login/models/login_request_model.dart';
import 'package:urun_catalog_project/feature/pages/login/models/token_model.dart';
import 'package:urun_catalog_project/feature/pages/login/service/IloginService.dart';

class LoginService extends ILoginService {
  LoginService(super.dio);

  @override
  Future<tokenModel?> postUserLogin(LoginRequestModel model) async {
    final response = await dio.post(loginPath, data: model);
    if (response.statusCode == 200) {
      return tokenModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
