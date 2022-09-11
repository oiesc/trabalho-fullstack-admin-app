// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on _ProductControllerBase, Store {
  late final _$productCategoryAtom =
      Atom(name: '_ProductControllerBase.productCategory', context: context);

  @override
  int get productCategory {
    _$productCategoryAtom.reportRead();
    return super.productCategory;
  }

  @override
  set productCategory(int value) {
    _$productCategoryAtom.reportWrite(value, super.productCategory, () {
      super.productCategory = value;
    });
  }

  late final _$_ProductControllerBaseActionController =
      ActionController(name: '_ProductControllerBase', context: context);

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
  String toString() {
    return '''
productCategory: ${productCategory}
    ''';
  }
}
