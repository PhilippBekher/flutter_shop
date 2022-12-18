import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../../../domain/model/products.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<Response?> getData() async {
    try {
      final Response? response = await _dio.get(
          'https://api.airtable.com/v0/appOaL4veCYYiUf1e/Items?api_key=keymeBbOhZfZnfH4p');
      return response;
    } catch (e) {
      print(e);
    }
  }
}
