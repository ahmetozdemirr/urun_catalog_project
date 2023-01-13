import 'package:urun_catalog_project/feature/pages/register/models/register_model.dart';
import 'package:urun_catalog_project/feature/pages/register/service/IregisterService.dart';

class RegisterService extends IRegisterService {
  RegisterService(super.dio);
  @override
  Future<RegisterModel?> postUserRegister(RegisterModel model) async {
    final response = await dio.post(registerPath, data: model);
    if (response.statusCode == 200) {
      return RegisterModel.fromJson(response.data);
    } else {
      null;
    }
  }
}
