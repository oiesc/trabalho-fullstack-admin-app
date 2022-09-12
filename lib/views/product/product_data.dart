import 'package:adminapp/controllers/product_controller.dart';
import 'package:adminapp/models/product_model.dart';
import 'package:adminapp/resources/global_colors.dart';
import 'package:adminapp/resources/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ProductData extends StatefulWidget {
  const ProductData({super.key, this.product});
  final ProductModel? product;

  @override
  State<ProductData> createState() => _ProductDataState();
}

class _ProductDataState extends State<ProductData> {
  final productController = GetIt.I.get<ProductController>();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      productController.productId = widget.product!.id!;
      productController.productName.text = widget.product!.name!;
      productController.productDescription.text = widget.product!.description!;
      productController.productPhotoUrl.text = widget.product!.photoLocation!;
      productController.productPrice.text = widget.product!.price!.toString();
      productController.changeProductCategory(widget.product!.category!.id);
    }
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
          title: Text(widget.product != null
              ? "Edit product - ${widget.product?.name}"
              : "New product"),
        ),
        body: Observer(builder: (_) {
          return Container(
            child: productController.isLoading
                ? const LoadingWidget()
                : SingleChildScrollView(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 16, bottom: 8),
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          controller: productController.productName,
                          decoration: const InputDecoration(
                            labelText: "Name",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          controller: productController.productDescription,
                          decoration: const InputDecoration(
                            labelText: "Description",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
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
                            left: 16, right: 16, top: 8, bottom: 8),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          controller: productController.productPrice,
                          decoration: const InputDecoration(
                            labelText: "Price",
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 16),
                          child: Observer(builder: (_) {
                            return DropdownButtonFormField(
                                decoration: const InputDecoration(
                                    labelText: "Category"),
                                borderRadius: BorderRadius.circular(8),
                                isExpanded: true,
                                value: productController.productCategory,
                                items: productController.categories
                                    ?.map((e) => DropdownMenuItem(
                                        value: e.id, child: Text("${e.name}")))
                                    .toList(),
                                onChanged: (value) => productController
                                    .changeProductCategory(value));
                          })),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: ElevatedButton(
                            onPressed: () async {
                              if (await productController.saveItem(
                                      productController.productId != null
                                          ? "update"
                                          : "create") !=
                                  null) {
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Confirm')),
                      ),
                      if (widget.product != null)
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: TextButton(
                            onPressed: () async {
                              if (await productController
                                  .deleteItem(widget.product?.id)) {
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'Delete Product',
                              style: TextStyle(color: GlobalColors.red),
                            ),
                          ),
                        ),
                    ]),
                  ),
          );
        }));
  }
}
