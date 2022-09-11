import 'package:adminapp/controllers/order_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  OrderController orderController = GetIt.I.get<OrderController>();

  @observable
  int listValue = 1;

  @action
  changeListValue(value) {
    listValue = value;
    orderController.changeListValue(value + 1);
  }
}
