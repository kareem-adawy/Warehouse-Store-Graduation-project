import 'package:http/http.dart' as http;
import 'package:mansour_udemy/Amazon%20Shop/Model/product_model.dart';

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
