import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'product_controller.g.dart';

class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {
  TextEditingController productName = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController productPhotoUrl = TextEditingController();

  @observable
  int productCategory = 1;

  @action
  changeProductCategory(value) => productCategory = value;

  dispose() {
    productName.clear();
    productDescription.clear();
    productPhotoUrl.clear();
    productCategory = 1;
  }
}
