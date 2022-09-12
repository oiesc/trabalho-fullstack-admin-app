import 'package:adminapp/resources/global_colors.dart';
import 'package:adminapp/resources/global_scaffold.dart';
import 'package:dio/dio.dart';

class GlobalProvider {
  final Dio _connection = Dio();

  _configDioNetwork() {
    _connection.options.connectTimeout = 300000;
    _connection.options.receiveTimeout = 600000;
  }

  GlobalProvider() {
    _configDioNetwork();
  }

  final String apiOrderUrl = "https://fathomless-reaches-54421.herokuapp.com/";
  final String apiProductUrl =
      "https://trabalho-fullstack-produto.herokuapp.com/";

  orderSendPost(route, data) async {
    try {
      String endPoint = apiOrderUrl + route;

      var response = await _connection.post(endPoint, data: data);

      return response.data;
    } on DioError catch (e) {
      Exception(e.response);
      _showMessage(e.response?.data['message'], type: "error");
      return false;
    }
  }

  orderSendGet(route) async {
    try {
      String endPoint = apiOrderUrl + route;

      var response = await _connection.get(endPoint);

      return response.data;
    } on DioError catch (e) {
      Exception(e.response);
      _showMessage(e.response?.data['message'], type: "error");
      return false;
    }
  }

  orderSendPatch(route, requestType) async {
    try {
      String endPoint = apiOrderUrl + route;

      var response = await _connection.patch(endPoint);

      _showMessage(requestType, type: "success");
      return response.data;
    } on DioError catch (e) {
      Exception(e.response);
      _showMessage(e.response?.data['message'], type: "error");
      return false;
    }
  }

  productSendPost(route, data) async {
    try {
      String endPoint = apiProductUrl + route;

      var response = await _connection.post(endPoint, data: data);

      return response.data;
    } on DioError catch (e) {
      Exception(e.response);
      _showMessage(e.response?.data['message'], type: "error");
      return false;
    }
  }

  productSendGet(route) async {
    try {
      String endPoint = apiProductUrl + route;

      var response = await _connection.get(endPoint);

      return response.data;
    } on DioError catch (e) {
      Exception(e.response);
      _showMessage(e.response?.data['message'], type: "error");
      return false;
    }
  }

  productSendPut(route, data, requestType) async {
    try {
      String endPoint = apiProductUrl + route;

      var response = await _connection.put(endPoint, data: data);

      _showMessage(requestType, type: "success");
      return response.data;
    } on DioError catch (e) {
      Exception(e.response);
      _showMessage(e.response?.data['message'], type: "error");
      return false;
    }
  }

  productSendDelete(route) async {
    try {
      String endPoint = apiProductUrl + route;

      var response = await _connection.delete(endPoint);

      return response.data;
    } on DioError catch (e) {
      Exception(e.response);
      _showMessage(e.response?.data['message'], type: "error");
      return false;
    }
  }

  _getMessage(type) {
    switch (type) {
      case "update":
        return "The item has been successfully updated!";
      case "cancel":
        return "The item has been successfully canceled!";
      case "create":
        return "The item has been successfully created!";
      case "delete":
        return "The item has been successfully deleted!";
      default:
        return type;
    }
  }

  _showMessage(request, {type}) {
    GlobalScaffold.instance.snackBarStatus(_getMessage(request),
        color: type != null
            ? type == "success"
                ? GlobalColors.green
                : GlobalColors.red
            : null);
  }
}
