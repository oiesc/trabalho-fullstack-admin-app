import 'package:adminapp/resources/global_colors.dart';

class GlobalFunctions {
  getProductsName(productsList) {
    return productsList.reduce((value, element) => value + ', ' + element);
  }

  getStatusColor(status) {
    switch (status) {
      case "pending":
        return GlobalColors.orange;
      case "accepted":
        return GlobalColors.green;
      case "canceled":
        return GlobalColors.red;
      default:
        return GlobalColors.blue;
    }
  }
}
