class ProductModel {
  String? name;
  double? price;
  String? photo;
  int? quantity;

  ProductModel({this.name, this.photo, this.price, this.quantity});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'].toDouble();
    quantity = json['quantity'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }
}
