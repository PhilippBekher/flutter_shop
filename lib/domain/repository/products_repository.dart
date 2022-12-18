import 'package:meta/meta.dart';
import 'package:myapp/data/api/service/api_service.dart';
import 'package:myapp/domain/model/products.dart';

class ProductsRepository {
  final ApiService apiService;

  Future<List<Record>> getProducts() async {
    final response = await apiService.getData();
    final data = response?.data;
    final Products products = Products.fromJson(data);

    return products.records;
  }

  const ProductsRepository({required this.apiService});
}
