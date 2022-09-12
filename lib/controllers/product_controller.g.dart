// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on _ProductControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ProductControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$productCategoryAtom =
      Atom(name: '_ProductControllerBase.productCategory', context: context);

  @override
  String? get productCategory {
    _$productCategoryAtom.reportRead();
    return super.productCategory;
  }

  @override
  set productCategory(String? value) {
    _$productCategoryAtom.reportWrite(value, super.productCategory, () {
      super.productCategory = value;
    });
  }

  late final _$idAtom =
      Atom(name: '_ProductControllerBase.id', context: context);

  @override
  String? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$listValueAtom =
      Atom(name: '_ProductControllerBase.listValue', context: context);

  @override
  String? get listValue {
    _$listValueAtom.reportRead();
    return super.listValue;
  }

  @override
  set listValue(String? value) {
    _$listValueAtom.reportWrite(value, super.listValue, () {
      super.listValue = value;
    });
  }

  late final _$categoriesAtom =
      Atom(name: '_ProductControllerBase.categories', context: context);

  @override
  List<CategoryModel>? get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<CategoryModel>? value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$productsAtom =
      Atom(name: '_ProductControllerBase.products', context: context);

  @override
  List<ProductModel>? get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductModel>? value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$bkpProductsAtom =
      Atom(name: '_ProductControllerBase.bkpProducts', context: context);

  @override
  List<ProductModel>? get bkpProducts {
    _$bkpProductsAtom.reportRead();
    return super.bkpProducts;
  }

  @override
  set bkpProducts(List<ProductModel>? value) {
    _$bkpProductsAtom.reportWrite(value, super.bkpProducts, () {
      super.bkpProducts = value;
    });
  }

  late final _$getCategoriesAsyncAction =
      AsyncAction('_ProductControllerBase.getCategories', context: context);

  @override
  Future getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  late final _$getProductsAsyncAction =
      AsyncAction('_ProductControllerBase.getProducts', context: context);

  @override
  Future getProducts() {
    return _$getProductsAsyncAction.run(() => super.getProducts());
  }

  late final _$_ProductControllerBaseActionController =
      ActionController(name: '_ProductControllerBase', context: context);

  @override
  dynamic changeLoading(dynamic value) {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.changeLoading');
    try {
      return super.changeLoading(value);
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeProductCategory(dynamic value) {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.changeProductCategory');
    try {
      return super.changeProductCategory(value);
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeListValue(dynamic value) {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.changeListValue');
    try {
      return super.changeListValue(value);
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
productCategory: ${productCategory},
id: ${id},
listValue: ${listValue},
categories: ${categories},
products: ${products},
bkpProducts: ${bkpProducts}
    ''';
  }
}
