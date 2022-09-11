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

  final String apiUrl = "https://fathomless-reaches-54421.herokuapp.com/";

  sendPost(route, data) async {
    try {
      String endPoint = apiUrl + route;

      var response = await _connection.post(endPoint, data: data);

      return response.data;
    } on DioError catch (e) {
      Exception(e.response);
      _showMessage(e.message, type: "error");
      return false;
    }
  }

  sendGet(route) async {
    try {
      String endPoint = apiUrl + route;

      var response = await _connection.get(endPoint);

      return response.data;
    } on DioError catch (e) {
      Exception(e.response);
      _showMessage(e.message, type: "error");
      return false;
    }
  }

  sendPatch(route, requestType) async {
    try {
      String endPoint = apiUrl + route;

      var response = await _connection.patch(endPoint);

      _showMessage(requestType, type: "success");
      return response.data;
    } on DioError catch (e) {
      Exception(e.response);
      _showMessage(e.message, type: "error");
      return false;
    }
  }

  _getMessage(type) {
    switch (type) {
      case "orderUpdate":
        return "The item has been successfully updated!";
      case "orderCancel":
        return "The item has been successfully canceled!";
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
