import 'package:urun_catalog_project/model/category_models.dart';
import 'package:urun_catalog_project/service/categoryservice/ICategoryService.dart';

class CategoryService extends ICategoryService {
  CategoryService(super.dio);

  @override
  Future<CategoryModel?> postUserCategory() async {
    final response = await dio.get(categoryPath);
    if (response.statusCode == 200) {
      return CategoryModel.fromJson(response.data);
    } else {
      null;
    }
  }
}
