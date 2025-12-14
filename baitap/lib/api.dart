import 'package:baitap/model/product.dart';
import 'package:dio/dio.dart';

class API{
  Future<List<Product>> getAllProduct() async {
    var url = 'https://fakestoreapi.com/products';
    var dio = Dio();
    var response = await dio.request(url);
    List<Product> listProduct = [];
    if(response.statusCode == 200){
      List list = response.data;
      listProduct = list.map((json)=>Product.formJson(json)).toList();
      print('Lay data thanh cong');
      print(listProduct[0].title);
    }
    else{
      print('Loi API');
    }
    return listProduct;
  }
}