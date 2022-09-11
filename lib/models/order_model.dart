import 'package:adminapp/models/product_model.dart';

class OrderModel {
  String? id;
  double? price;
  List<ProductModel>? products;
  String? status;
  String? usuario;
  List? productsName;

  OrderModel({this.id, this.price, this.products, this.status, this.usuario});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'].toDouble();
    if (json['products'] != null) {
      products = <ProductModel>[];
      productsName = [];
      json['products'].forEach((v) {
        products!.add(ProductModel.fromJson(v));
        productsName!.add(v['name']);
      });
      productsName = productsName!.toSet().toList();
    }
    status = json['status'];
    usuario = json['usuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['usuario'] = usuario;
    return data;
  }
}
