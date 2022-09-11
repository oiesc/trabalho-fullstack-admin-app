// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderController on _OrderControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_OrderControllerBase.isLoading', context: context);

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

  late final _$listValueAtom =
      Atom(name: '_OrderControllerBase.listValue', context: context);

  @override
  int get listValue {
    _$listValueAtom.reportRead();
    return super.listValue;
  }

  @override
  set listValue(int value) {
    _$listValueAtom.reportWrite(value, super.listValue, () {
      super.listValue = value;
    });
  }

  late final _$ordersAtom =
      Atom(name: '_OrderControllerBase.orders', context: context);

  @override
  List<OrderModel>? get orders {
    _$ordersAtom.reportRead();
    return super.orders;
  }

  @override
  set orders(List<OrderModel>? value) {
    _$ordersAtom.reportWrite(value, super.orders, () {
      super.orders = value;
    });
  }

  late final _$bkpOrdersAtom =
      Atom(name: '_OrderControllerBase.bkpOrders', context: context);

  @override
  List<OrderModel>? get bkpOrders {
    _$bkpOrdersAtom.reportRead();
    return super.bkpOrders;
  }

  @override
  set bkpOrders(List<OrderModel>? value) {
    _$bkpOrdersAtom.reportWrite(value, super.bkpOrders, () {
      super.bkpOrders = value;
    });
  }

  late final _$getOrdersAsyncAction =
      AsyncAction('_OrderControllerBase.getOrders', context: context);

  @override
  Future getOrders() {
    return _$getOrdersAsyncAction.run(() => super.getOrders());
  }

  late final _$_OrderControllerBaseActionController =
      ActionController(name: '_OrderControllerBase', context: context);

  @override
  dynamic changeLoading(dynamic value) {
    final _$actionInfo = _$_OrderControllerBaseActionController.startAction(
        name: '_OrderControllerBase.changeLoading');
    try {
      return super.changeLoading(value);
    } finally {
      _$_OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeListValue(dynamic value) {
    final _$actionInfo = _$_OrderControllerBaseActionController.startAction(
        name: '_OrderControllerBase.changeListValue');
    try {
      return super.changeListValue(value);
    } finally {
      _$_OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
listValue: ${listValue},
orders: ${orders},
bkpOrders: ${bkpOrders}
    ''';
  }
}
