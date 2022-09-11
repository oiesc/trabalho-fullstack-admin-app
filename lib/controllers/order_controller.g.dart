// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderController on _OrderControllerBase, Store {
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

  late final _$_OrderControllerBaseActionController =
      ActionController(name: '_OrderControllerBase', context: context);

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
listValue: ${listValue}
    ''';
  }
}
