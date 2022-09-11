import 'package:adminapp/controllers/home_controller.dart';
import 'package:adminapp/models/order_model.dart';
import 'package:adminapp/repositories/global_api.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'order_controller.g.dart';

class OrderController = _OrderControllerBase with _$OrderController;

abstract class _OrderControllerBase with Store {
  final GlobalApi rep = GetIt.I.get<GlobalApi>();

  dispose() {
    changeLoading(false);
  }

  @observable
  bool isLoading = false;

  @action
  changeLoading(value) => isLoading = value;

  @observable
  int listValue = 1;

  @action
  changeListValue(value) {
    listValue = value;
    if (value == 2) {
      orders =
          bkpOrders?.where((element) => element.status == 'pending').toList();
    } else if (value == 3) {
      orders =
          bkpOrders?.where((element) => element.status == 'accepted').toList();
    } else if (value == 4) {
      orders =
          bkpOrders?.where((element) => element.status == 'canceled').toList();
    } else if (value == 5) {
      orders =
          bkpOrders?.where((element) => element.status == 'completed').toList();
    } else {
      orders = bkpOrders;
    }
  }

  @observable
  List<OrderModel>? orders;

  @observable
  List<OrderModel>? bkpOrders;

  @action
  getOrders() async {
    changeLoading(true);
    bkpOrders = await rep.getOrders();
    orders = bkpOrders;
    changeLoading(false);
  }
}
