class ProductModel {
  String? id;
  String? name;
  double? price;
  String? description;
  String? photoLocation;
  CategoryModel? category;
  int? quantity;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.photoLocation,
      this.category,
      this.quantity});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    quantity = json['quantity'];
    photoLocation = json['photoLocation'];
    if (json['categoriesDto'] != null) {
      category = CategoryModel.fromJson(json['categoriesDto']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['photoLocation'] = photoLocation;
    data['categoriesDto'] = category!.toJson();
    return data;
  }
}

class CategoryModel {
  final String id;
  final String? name;

  CategoryModel({required this.id, this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json['id'].toString(), name: json['name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
