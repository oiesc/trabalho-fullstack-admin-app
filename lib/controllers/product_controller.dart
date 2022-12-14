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
  TextEditingController categoryName = TextEditingController();

  @observable
  bool isLoading = false;

  @action
  changeLoading(value) => isLoading = value;

  @observable
  String? productCategory;

  @observable
  String? productId;

  String? categoryId;

  @action
  changeProductCategory(value) => productCategory = value;

  dispose() {
    productId = null;
    productName.clear();
    productDescription.clear();
    productPhotoUrl.clear();
    productPrice.clear();
    productCategory = categories!.first.id;
    changeLoading(false);
  }

  categoryDispose() {
    categoryName.clear();
    categoryId = null;
    changeLoading(false);
  }

  @observable
  String? listValue;

  @action
  changeListValue(value) {
    listValue = value;
    if (value == "0") {
      products = bkpProducts;
    } else {
      products = bkpProducts
          ?.where((element) => element.category?.id == value)
          .toList();
    }
  }

  @observable
  List<CategoryModel>? categories;

  List<CategoryModel> filter = [];

  @observable
  List<ProductModel>? products;

  @observable
  List<ProductModel>? bkpProducts;

  @action
  getCategories() async {
    changeLoading(true);
    categories = await rep.getCategories();
    filter = [];
    filter.add(CategoryModel(id: "0", name: "All"));
    filter.addAll(categories!.toList());
    changeLoading(false);
  }

  @action
  getProducts() async {
    changeLoading(true);
    bkpProducts = await rep.getProducts();
    products = bkpProducts;
    changeListValue("0");
    changeLoading(false);
  }

  saveItem(type) async {
    changeLoading(true);
    ProductModel product = ProductModel(
      id: productId,
      category: CategoryModel(id: productCategory!),
      name: productName.text,
      description: productDescription.text,
      photoLocation: productPhotoUrl.text,
      price: double.parse(productPrice.text),
    );

    var temp = type == "update"
        ? await rep.updateProduct(product.toJson())
        : await rep.createProduct(product.toJson());
    changeLoading(false);
    getProducts();
    return temp.id;
  }

  deleteItem(id) async {
    changeLoading(true);
    var temp = await rep.deleteProduct(id);
    changeLoading(false);
    getProducts();
    return temp;
  }

  saveCategory(type) async {
    changeLoading(true);
    CategoryModel category =
        CategoryModel(id: categoryId, name: categoryName.text);
    var temp = type == "update"
        ? await rep.updateCategory(category.toJson())
        : await rep.createCategory(category.toJson());
    changeLoading(false);
    getProducts();
    getCategories();
    return temp;
  }

  deleteCategory() async {
    changeLoading(true);
    CategoryModel category =
        CategoryModel(id: categoryId, name: categoryName.text);
    var temp = await rep.deleteCategory(category.toJson());
    changeLoading(false);
    getProducts();
    getCategories();
    return temp;
  }
}
