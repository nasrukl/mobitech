import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobitechproject/model/model.dart';

class ApiServices {
  final Dio dio = Dio();
  Future<List<ProductModel>?> getApi() async {
    try {
      Response response = await dio.get(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
      if (response.statusCode == 200) {
        final jsonresponse = json.encode(response.data);
        return productModelFromJson(jsonresponse);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
