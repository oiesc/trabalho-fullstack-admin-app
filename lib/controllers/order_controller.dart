import 'package:adminapp/repositories/global_api.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'order_controller.g.dart';

class OrderController = _OrderControllerBase with _$OrderController;

abstract class _OrderControllerBase with Store {
  final GlobalApi rep = GetIt.I.get<GlobalApi>();

  @observable
  int listValue = 1;

  @action
  changeListValue(value) => listValue = value;

  void getOrders() async {
    var temp = await rep.getOrders();

    temp.forEach((element) {
      print(element.toJson());
    });
  }
}
