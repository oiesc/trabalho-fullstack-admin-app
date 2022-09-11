import 'package:adminapp/controllers/product_controller.dart';
import 'package:adminapp/resources/global_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ProductData extends StatefulWidget {
  const ProductData({super.key, this.productId});
  final String? productId;

  @override
  State<ProductData> createState() => _ProductDataState();
}

class _ProductDataState extends State<ProductData> {
  final productController = GetIt.I.get<ProductController>();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    productController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productId != null
            ? "Edit product #${widget.productId}"
            : "New product"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
            child: TextField(
              textInputAction: TextInputAction.next,
              controller: productController.productName,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: TextField(
              textInputAction: TextInputAction.next,
              controller: productController.productDescription,
              decoration: const InputDecoration(
                labelText: "Description",
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: productController.productPhotoUrl,
              decoration: const InputDecoration(
                labelText: "Photo url",
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 8, bottom: 16),
              child: Observer(builder: (_) {
                return DropdownButtonFormField(
                    decoration: const InputDecoration(labelText: "Category"),
                    borderRadius: BorderRadius.circular(8),
                    isExpanded: true,
                    value: productController.productCategory,
                    items: const [
                      DropdownMenuItem(value: 1, child: Text('Sandwich')),
                      DropdownMenuItem(value: 2, child: Text('Drink')),
                    ],
                    onChanged: (value) =>
                        productController.changeProductCategory(value));
              })),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
                onPressed: () {
                  GlobalScaffold.instance.snackBarStatus("Teste");
                },
                child: const Text('Confirm')),
          )
        ]),
      ),
    );
  }
}
