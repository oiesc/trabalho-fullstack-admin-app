import 'package:adminapp/models/order_model.dart';
import 'package:adminapp/provider/global_request.dart';
import 'package:get_it/get_it.dart';

class GlobalApi {
  GlobalProvider provider = GetIt.I.get<GlobalProvider>();

  Future<List<OrderModel>> getOrders() async {
    List<OrderModel> orders = [];

    var ret = await provider.sendGet("orders");

    if (ret != false) {
      ret.forEach((e) => orders.add(OrderModel.fromJson(e)));
    }

    return orders;
  }

  Future<OrderModel> acceptOrder(id) async {
    var ret = await provider.sendPatch("orders/$id/accept", "orderUpdate");

    OrderModel order = OrderModel();
    if (ret != false) {
      order = OrderModel.fromJson(ret);
    }

    return order;
  }

  Future<OrderModel> cancelOrder(id) async {
    var ret = await provider.sendPatch("orders/$id/cancel", "orderCancel");

    OrderModel order = OrderModel();
    if (ret != false) {
      order = OrderModel.fromJson(ret);
    }

    return order;
  }
}
