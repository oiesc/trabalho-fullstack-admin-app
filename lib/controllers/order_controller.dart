import 'package:mobx/mobx.dart';
part 'order_controller.g.dart';

class OrderController = _OrderControllerBase with _$OrderController;

abstract class _OrderControllerBase with Store {
  @observable
  int listValue = 1;

  @action
  changeListValue(value) => listValue = value;
}
