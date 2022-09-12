import 'package:adminapp/models/order_model.dart';
import 'package:adminapp/models/product_model.dart';
import 'package:adminapp/provider/global_request.dart';
import 'package:get_it/get_it.dart';

class GlobalApi {
  GlobalProvider provider = GetIt.I.get<GlobalProvider>();

  //Orders
  Future<List<OrderModel>> getOrders() async {
    List<OrderModel> orders = [];

    var ret = await provider.orderSendGet("orders");

    if (ret != false) {
      ret.forEach((e) => orders.add(OrderModel.fromJson(e)));
    }

    return orders;
  }

  Future<OrderModel> acceptOrder(id) async {
    var ret = await provider.orderSendPatch("orders/$id/accept", "update");

    OrderModel order = OrderModel();
    if (ret != false) {
      order = OrderModel.fromJson(ret);
    }

    return order;
  }

  Future<OrderModel> cancelOrder(id) async {
    var ret = await provider.orderSendPatch("orders/$id/cancel", "cancel");

    OrderModel order = OrderModel();
    if (ret != false) {
      order = OrderModel.fromJson(ret);
    }

    return order;
  }

  //Products
  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> products = [];

    var ret = await provider.productSendGet("product/search/all");

    if (ret != false) {
      ret.forEach((e) => products.add(ProductModel.fromJson(e)));
    }

    return products;
  }

  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories = [];

    var ret = await provider.productSendGet("category");

    if (ret != false) {
      ret.forEach((e) => categories.add(CategoryModel.fromJson(e)));
    }
    return categories;
  }

  Future<ProductModel> updateProduct(data) async {
    ProductModel product = ProductModel();

    var ret = await provider.productSendPut("product", data, "update");
    if (ret != false) {
      product = ProductModel.fromJson(ret);
    }

    return product;
  }

  Future<ProductModel> createProduct(data) async {
    ProductModel product = ProductModel();

    var ret = await provider.productSendPost("product/create", data, "create");
    if (ret != false) {
      product = ProductModel.fromJson(ret);
    }

    return product;
  }

  Future<bool> deleteProduct(id) async {
    return await provider.productSendDelete("product/$id");
  }
}
