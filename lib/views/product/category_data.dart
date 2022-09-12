import 'package:adminapp/controllers/product_controller.dart';
import 'package:adminapp/models/product_model.dart';
import 'package:adminapp/resources/global_colors.dart';
import 'package:adminapp/resources/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CategoryData extends StatefulWidget {
  const CategoryData({super.key, this.category});
  final CategoryModel? category;

  @override
  State<CategoryData> createState() => _CategoryDataState();
}

class _CategoryDataState extends State<CategoryData> {
  final productController = GetIt.I.get<ProductController>();

  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      productController.categoryId = widget.category!.id;
      productController.categoryName.text = widget.category!.name.toString();
    }
  }

  @override
  void dispose() {
    productController.categoryDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.category != null
              ? "Edit category ${widget.category?.name}"
              : "New category")),
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
                        controller: productController.categoryName,
                        decoration: const InputDecoration(
                          labelText: "Name",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                          onPressed: () async {
                            if (await productController.saveCategory(
                                productController.categoryId != null
                                    ? "update"
                                    : "create")) {
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Confirm')),
                    ),
                    if (widget.category != null)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextButton(
                          onPressed: () async {
                            if (await productController.deleteCategory()) {
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            'Delete Category',
                            style: TextStyle(color: GlobalColors.red),
                          ),
                        ),
                      ),
                  ])));
      }),
    );
  }
}
