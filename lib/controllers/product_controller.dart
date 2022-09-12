import 'package:adminapp/models/product_model.dart';
import 'package:adminapp/repositories/global_api.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'product_controller.g.dart';

class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {
  final GlobalApi rep = GetIt.I.get<GlobalApi>();

  TextEditingController productName = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController productPhotoUrl = TextEditingController();
  TextEditingController productPrice = TextEditingController();

  @observable
  bool isLoading = false;

  @action
  changeLoading(value) => isLoading = value;

  @observable
  String? productCategory;

  @observable
  String? id;

  @action
  changeProductCategory(value) => productCategory = value;

  dispose() {
    id = null;
    productName.clear();
    productDescription.clear();
    productPhotoUrl.clear();
    productPrice.clear();
    productCategory = categories!.first.id;
    changeLoading(false);
  }

  @observable
  List<CategoryModel>? categories;

  @observable
  List<ProductModel>? products;

  @observable
  List<ProductModel>? bkpProducts;

  @action
  getCategories() async {
    changeLoading(true);
    categories = await rep.getCategories();
    changeLoading(false);
  }

  @action
  getProducts() async {
    changeLoading(true);
    bkpProducts = await rep.getProducts();
    products = bkpProducts;
    changeLoading(false);
  }

  saveItem(type) async {
    changeLoading(true);
    ProductModel product = ProductModel(
      id: id,
      category: CategoryModel(id: productCategory!),
      name: productName.text,
      description: productDescription.text,
      photoLocation: productPhotoUrl.text,
      price: double.parse(productPrice.text),
    );

    var temp =
        type == "update" ? await rep.updateProduct(product.toJson()) : null;
    getProducts();
    return temp?.id;
  }
}
