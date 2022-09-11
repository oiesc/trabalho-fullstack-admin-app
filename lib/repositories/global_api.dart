import 'package:adminapp/models/order_model.dart';
import 'package:adminapp/provider/global_request.dart';
import 'package:get_it/get_it.dart';

class GlobalApi {
  GlobalProvider provider = GetIt.I.get<GlobalProvider>();

  Future<List<OrderModel>> getOrders() async {
    List<OrderModel> orders = [];

    var ret = await provider.sendGet("orders");

    ret.forEach((e) => orders.add(OrderModel.fromJson(e)));

    return orders;
  }
}
